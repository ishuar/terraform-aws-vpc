resource "aws_eip" "this" {
  domain = "vpc"
}
resource "aws_nat_gateway" "public" {
  allocation_id = aws_eip.this.id
  subnet_id     = module.bootstrap_routing_vpc.public_subnet_ids["subnet01"]
}

module "bootstrap_routing_vpc" {
  source     = "../../"
  prefix     = "simple"
  env        = "dev"
  region     = var.region
  cidr_block = "10.1.0.0/16"
  ## Subnets
  public_subnets = [
    {
      name              = "subnet01"
      cidr_block        = "10.1.1.0/24"
      availability_zone = "${var.region}a"
    },
    {
      name       = "subnet02"
      cidr_block = "10.1.3.0/24"
    }
  ]

  private_subnets = [
    {
      name              = "subnet01"
      cidr_block        = "10.1.2.0/24"
      availability_zone = "${var.region}a"
    },
    {
      name       = "subnet02"
      cidr_block = "10.1.4.0/24"
    }
  ]
  ## Private Routing inside the VPC
  create_private_route_table = true
  private_subnet_routes = {
    "default-route-to-nat-gw" = {
      destination_cidr_block = "0.0.0.0/0"
      nat_gateway_id         = aws_nat_gateway.public.id
    }
  }
}

