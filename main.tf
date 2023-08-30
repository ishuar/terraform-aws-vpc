# ref : https://registry.terraform.io/providers/hashicorp/aws/5.14.0/docs/resources/vpc
resource "aws_vpc" "this" {

  cidr_block                       = var.cidr_block
  ipv4_ipam_pool_id                = var.ipv4_ipam_pool_id
  ipv4_netmask_length              = var.ipv4_netmask_length
  ipv6_cidr_block                  = var.ipv6_cidr_block
  instance_tenancy                 = var.instance_tenancy
  enable_dns_hostnames             = var.enable_dns_hostnames
  enable_dns_support               = var.enable_dns_support
  ipv6_ipam_pool_id                = var.ipv6_ipam_pool_id
  ipv6_netmask_length              = var.ipv6_netmask_length
  assign_generated_ipv6_cidr_block = var.assign_generated_ipv6_cidr_block

  tags = merge(var.tags,
    {
      Name = "${var.prefix}-${var.env}-vpc-${var.cidr_block}-${var.region}"
    },
  )
}

# ref: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet
resource "aws_subnet" "public_subnet" {
  for_each                                       = { for subnet in var.public_subnets : subnet.name => subnet }
  vpc_id                                         = aws_vpc.this.id
  cidr_block                                     = each.value.cidr_block
  availability_zone                              = each.value.availability_zone
  availability_zone_id                           = each.value.availability_zone_id
  map_public_ip_on_launch                        = each.value.map_public_ip_on_launch
  assign_ipv6_address_on_creation                = each.value.assign_ipv6_address_on_creation
  enable_dns64                                   = each.value.enable_dns64
  enable_resource_name_dns_aaaa_record_on_launch = each.value.enable_resource_name_dns_aaaa_record_on_launch
  enable_resource_name_dns_a_record_on_launch    = each.value.enable_resource_name_dns_a_record_on_launch
  ipv6_cidr_block                                = each.value.ipv6_cidr_block
  private_dns_hostname_type_on_launch            = each.value.private_dns_hostname_type_on_launch

  tags = merge(
    var.tags,
    each.value.public_subnet_tags,
    { Name = "${var.prefix}-${var.env}-pub-${each.value.name}-${each.value.cidr_block}" }
  )
}

resource "aws_subnet" "private_subnet" {
  for_each                                       = { for subnet in var.private_subnets : subnet.name => subnet }
  vpc_id                                         = aws_vpc.this.id
  cidr_block                                     = each.value.cidr_block
  availability_zone                              = each.value.availability_zone
  availability_zone_id                           = each.value.availability_zone_id
  map_public_ip_on_launch                        = false
  assign_ipv6_address_on_creation                = false
  enable_dns64                                   = each.value.enable_dns64
  enable_resource_name_dns_aaaa_record_on_launch = each.value.enable_resource_name_dns_aaaa_record_on_launch
  enable_resource_name_dns_a_record_on_launch    = each.value.enable_resource_name_dns_a_record_on_launch
  ipv6_cidr_block                                = each.value.ipv6_cidr_block
  private_dns_hostname_type_on_launch            = each.value.private_dns_hostname_type_on_launch
  tags = merge(
    var.tags,
    each.value.private_subnet_tags,
    { Name = "${var.prefix}-${var.env}-prv-${each.value.name}-${each.value.cidr_block}" }
  )
}

# ref: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway
resource "aws_internet_gateway" "this" {
  count = length(var.public_subnets) > 0 ? 1 : 0

  vpc_id = aws_vpc.this.id
  tags = merge(var.tags,
    {
      Name = "${var.prefix}-${var.env}-igw-${var.region}"
  })
}

locals {
  first_private_subnet_id = values({ for k, v in aws_subnet.private_subnet : k => v.id })[0]
}

# ref: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_instance_connect_endpoint
resource "aws_ec2_instance_connect_endpoint" "this" {
  count = length(var.private_subnets) > 0 && var.enable_instance_connect_endpoint ? 1 : 0

  subnet_id          = local.first_private_subnet_id
  preserve_client_ip = var.preserve_client_ip
  security_group_ids = var.security_group_ids
  tags = merge(var.tags,
    {
      Name = "${var.prefix}-${var.env}-instance-connect-vpc-endpoint-${var.region}"
    }, var.instance_connect_endpoint_tags
  )
  depends_on = [aws_subnet.private_subnet]
}
