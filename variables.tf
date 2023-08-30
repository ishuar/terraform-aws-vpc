#######################
## Global
######################

variable "prefix" {
  type        = string
  description = "(Optional) Prefix to use in resource naming."
  default     = ""
}

variable "env" {
  type        = string
  description = "(Optional) Env name to use in resource naming."
  default     = "dev"
}

variable "region" {
  type        = string
  description = "(Optional) Region to use in resource naming."
  default     = "eu-central-1"
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = {}
}

#######################
## VPC
######################

variable "cidr_block" {
  type        = string
  description = "(optional) describe your variable"
}

variable "instance_tenancy" {
  type        = string
  description = "(Optional) A tenancy option for instances launched into the VPC. Default is default, which ensures that EC2 instances launched in this VPC use the EC2 instance tenancy attribute specified when the EC2 instance is launched. The only other option is dedicated, which ensures that EC2 instances launched in this VPC are run on dedicated tenancy instances regardless of the tenancy attribute specified at launch. This has a dedicated per region fee of $2 per hour, plus an hourly per instance usage fee."
  default     = null
}

variable "ipv4_ipam_pool_id" {
  type        = string
  description = "(Optional) The ID of an IPv4 IPAM pool you want to use for allocating this VPC's CIDR. IPAM is a VPC feature that you can use to automate your IP address management workflows including assigning, tracking, troubleshooting, and auditing IP addresses across AWS Regions and accounts. Using IPAM you can monitor IP address usage throughout your AWS Organization."
  default     = null
}

variable "ipv4_netmask_length" {
  type        = string
  description = "(Optional) The netmask length of the IPv4 CIDR you want to allocate to this VPC. Requires specifying a ipv4_ipam_pool_id."
  default     = null
}

variable "ipv6_cidr_block" {
  type        = string
  description = "(Optional) IPv6 CIDR block to request from an IPAM Pool. Can be set explicitly or derived from IPAM using ipv6_netmask_length."
  default     = null
}

variable "ipv6_ipam_pool_id" {
  type        = string
  description = "(Optional) IPAM Pool ID for a IPv6 pool. Conflicts with assign_generated_ipv6_cidr_block."
  default     = null
}

variable "ipv6_netmask_length" {
  type        = string
  description = "(Optional) Netmask length to request from IPAM Pool. Conflicts with ipv6_cidr_block. This can be omitted if IPAM pool as a allocation_default_netmask_length set. Valid values: 56."
  default     = null
}

variable "ipv6_cidr_block_network_border_group" {
  type        = string
  description = "(Optional) By default when an IPv6 CIDR is assigned to a VPC a default ipv6_cidr_block_network_border_group will be set to the region of the VPC. This can be changed to restrict advertisement of public addresses to specific Network Border Groups such as LocalZones."
  default     = null
}

variable "enable_dns_support" {
  type        = bool
  description = "(Optional) A boolean flag to enable/disable DNS support in the VPC. Defaults to true."
  default     = null
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "(Optional) A boolean flag to enable/disable DNS hostnames in the VPC. Defaults false."
  default     = null
}

variable "assign_generated_ipv6_cidr_block" {
  type        = bool
  description = "(Optional) Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC. You cannot specify the range of IP addresses, or the size of the CIDR block. Default is false. Conflicts with ipv6_ipam_pool_id"
  default     = null
}

variable "use_created_igw_for_public_routing" {
  type        = bool
  description = "(optional) Whether to use IGW created within the module for public route to internet or not?"
  default     = true
}

#######################
##  Subnets
######################

variable "public_subnet" {
  type = list(object({
    name                                           = optional(string)
    cidr_block                                     = optional(string)
    availability_zone_id                           = optional(string)
    availability_zone                              = optional(string)
    map_public_ip_on_launch                        = optional(bool, true)
    assign_ipv6_address_on_creation                = optional(bool, null)
    enable_dns64                                   = optional(bool, null)
    enable_resource_name_dns_aaaa_record_on_launch = optional(bool, null)
    enable_resource_name_dns_a_record_on_launch    = optional(bool, null)
    ipv6_cidr_block                                = optional(string, null)
    private_dns_hostname_type_on_launch            = optional(string, null)
    public_subnet_tags                             = optional(map(string), {})
  }))
  description = "(optional) Public Subnets created within the VPC"
  default     = []
}

variable "private_subnet" {
  type = list(object({
    name                                           = optional(string)
    cidr_block                                     = optional(string)
    availability_zone_id                           = optional(string)
    availability_zone                              = optional(string)
    enable_dns64                                   = optional(bool, null)
    enable_resource_name_dns_aaaa_record_on_launch = optional(bool, null)
    enable_resource_name_dns_a_record_on_launch    = optional(bool, null)
    ipv6_cidr_block                                = optional(string, null)
    private_dns_hostname_type_on_launch            = optional(string, null)
    private_subnet_tags                            = optional(map(string), {})
  }))
  description = "(optional) Private Subnets created within the VPC"
  default     = []
}

#######################
##  Routing
######################

variable "create_private_route_table" {
  type        = bool
  description = "(optional) Whether to create the initial/bootstrap private route tables and routes or not?"
  default     = false
}

variable "private_routes" {
  type = map(object({
    destination_cidr_block     = optional(string, null)
    destination_prefix_list_id = optional(string, null)
    transit_gateway_id         = optional(string, null)
    nat_gateway_id             = optional(string, null)
    vpc_endpoint_id            = optional(string, null)
    carrier_gateway_id         = optional(string, null)
    egress_only_gateway_id     = optional(string, null)
    network_interface_id       = optional(string, null)
    vpc_peering_connection_id  = optional(string, null)
  }))
  description = <<-EOF
(optional) Private route rules block.
"One of the destination_cidr_block or destination_prefix_list_id argument must be supplied:"
One of the following target arguments must be supplied:
  - carrier_gateway_id - Identifier of a carrier gateway. This attribute can only be used when the VPC contains a subnet which is associated with a Wavelength Zone.
  - egress_only_gateway_id - Identifier of a VPC Egress Only Internet Gateway.
  - gateway_id - Identifier of a VPC internet gateway or a virtual private gateway. Specify local when updating a previously imported local route.
  - nat_gateway_id - Identifier of a VPC NAT gateway.
  - network_interface_id - Identifier of an EC2 network interface.
  - transit_gateway_id - Identifier of an EC2 Transit Gateway.
  - vpc_endpoint_id - Identifier of a VPC Endpoint.
  - vpc_peering_connection_id - Identifier of a VPC peering connection.
EOF
  default     = {}
}

variable "public_routes" {
  type = map(object({
    name                       = optional(string, null)
    destination_cidr_block     = optional(string, null)
    destination_prefix_list_id = optional(string, null)
    egress_only_gateway_id     = optional(string, null)
    gateway_id                 = optional(string, null)
  }))

  description = <<-EOF
(optional) Public route rules block.
"One of the destination_cidr_block or destination_prefix_list_id argument must be supplied:"
One of the following target arguments must be supplied:
  - egress_only_gateway_id - Identifier of a VPC Egress Only Internet Gateway.
  - gateway_id - Identifier of a VPC internet gateway or a virtual private gateway. Specify local when updating a previously imported local route.
EOF
  default     = {}
}
