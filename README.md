<!-- PROJECT SHIELDS -->
<!--
*** declarations on the bottom of this document
managed within the footer file
-->
[![License][license-shield]][license-url] [![Contributors][contributors-shield]][contributors-url] [![Issues][issues-shield]][issues-url] [![Forks][forks-shield]][forks-url] [![Stargazers][stars-shield]][stars-url]

<div id="top"></div>
<!-- PROJECT LOGO -->
<br />
<div align="center">

  <h1 align="center"><strong>AWS VPC Terraform Module</strong></h1>
  <p align="center">
    🌩️ Terraform Module For Simplifying AWS VPC Creation 🌩️
    <br/>
    <a href="https://github.com/ishuar/terraform-aws-vpc/issues"><strong>Report Bug</a></strong> or <a href="https://github.com/ishuar/terraform-aws-vpc/issues"><strong>Request Feature</a></strong>
    <br/>
    <br/>
  </p>
</div>

## Background Knowledge or External Documentation

- [What is Amazon VPC](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html)
- [Subnets for your VPC](https://docs.aws.amazon.com/vpc/latest/userguide/configure-subnets.html)

### Pre-requisites

| Name        | Version Used | Help                                                                                                 | Required |
|-------------|--------------|------------------------------------------------------------------------------------------------------|----------|
| Terraform   | `>= 1.3.0`   | [Install Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) | Yes      |
| AWS Account | `N/A`        | [Create AWS account](https://aws.amazon.com/account/)                                                | yes      |

**⭐️ Don't forget to give the project a star! Thanks again! ⭐️**

## Introduction

🚀 This module is your ticket to effortlessly create a Virtual Private Cloud (VPC). Whether you're a seasoned cloud architect or just getting started, this module streamlines the process, giving you more time to focus on what truly matters. 🚀

## Available Features

- AWS VPC Creation.
- AWS VPC Multiple Public and Private Subnets Creation.
- Optional Bootstrap routing
- Optional internet Gateway creation with a default route in public subnets.

## Usage

```hcl
## simple vpc

module "simple_vpc" {

  source  = "ishuar/vpc/aws"
  version = "~> 2.0"

  prefix     = "simple"
  env        = "dev"
  region     = "eu-central-1"
  cidr_block = "10.1.0.0/16"

  ## Subnets
  public_subnets = [
    {
      name              = "subnet01"
      cidr_block        = "10.1.1.0/24"
      availability_zone = "eu-central-1"
    },
    # {
    #   name              = "subnet02"
    #   cidr_block        = "10.1.3.0/24"
    #   availability_zone = "eu-central-1b"
    # }
  ]

  private_subnets = [
    {
      name              = "subnet01"
      cidr_block        = "10.1.2.0/24"
      availability_zone = "eu-central-1a"
    },
    # {
    #   name              = "subnet02"
    #   cidr_block        = "10.1.4.0/24"
    #   availability_zone = "eu-central-1b"
    # }
  ]
}

```

## Examples

Examples are availabe in `examples` directory.

- [simple](/example/simple)
- [bootstrap-routing](/example/bootstrap-routing)

## Submodule

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~>5.14 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~>5.14 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ec2_instance_connect_endpoint.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_instance_connect_endpoint) | resource |
| [aws_internet_gateway.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_route.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.public_subnet_default_to_igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route_table.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.private_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | (optional) describe your variable | `string` | n/a | yes |
| <a name="input_assign_generated_ipv6_cidr_block"></a> [assign\_generated\_ipv6\_cidr\_block](#input\_assign\_generated\_ipv6\_cidr\_block) | (Optional) Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC. You cannot specify the range of IP addresses, or the size of the CIDR block. Default is false. Conflicts with ipv6\_ipam\_pool\_id | `bool` | `null` | no |
| <a name="input_create_private_route_table"></a> [create\_private\_route\_table](#input\_create\_private\_route\_table) | (optional) Whether to create the initial/bootstrap private route tables and routes or not? | `bool` | `false` | no |
| <a name="input_enable_dns_hostnames"></a> [enable\_dns\_hostnames](#input\_enable\_dns\_hostnames) | (Optional) A boolean flag to enable/disable DNS hostnames in the VPC. Defaults false. | `bool` | `null` | no |
| <a name="input_enable_dns_support"></a> [enable\_dns\_support](#input\_enable\_dns\_support) | (Optional) A boolean flag to enable/disable DNS support in the VPC. Defaults to true. | `bool` | `null` | no |
| <a name="input_enable_instance_connect_endpoint"></a> [enable\_instance\_connect\_endpoint](#input\_enable\_instance\_connect\_endpoint) | (optional) Whether to enable instance connect endpoint or not? | `bool` | `false` | no |
| <a name="input_env"></a> [env](#input\_env) | (Optional) Env name to use in resource naming. | `string` | `"dev"` | no |
| <a name="input_instance_connect_endpoint_tags"></a> [instance\_connect\_endpoint\_tags](#input\_instance\_connect\_endpoint\_tags) | (Optional) Map of tags to assign to this ec2 instance connect endpoint resource | `map(string)` | `{}` | no |
| <a name="input_instance_tenancy"></a> [instance\_tenancy](#input\_instance\_tenancy) | (Optional) A tenancy option for instances launched into the VPC. Default is default, which ensures that EC2 instances launched in this VPC use the EC2 instance tenancy attribute specified when the EC2 instance is launched. The only other option is dedicated, which ensures that EC2 instances launched in this VPC are run on dedicated tenancy instances regardless of the tenancy attribute specified at launch. This has a dedicated per region fee of $2 per hour, plus an hourly per instance usage fee. | `string` | `null` | no |
| <a name="input_ipv4_ipam_pool_id"></a> [ipv4\_ipam\_pool\_id](#input\_ipv4\_ipam\_pool\_id) | (Optional) The ID of an IPv4 IPAM pool you want to use for allocating this VPC's CIDR. IPAM is a VPC feature that you can use to automate your IP address management workflows including assigning, tracking, troubleshooting, and auditing IP addresses across AWS Regions and accounts. Using IPAM you can monitor IP address usage throughout your AWS Organization. | `string` | `null` | no |
| <a name="input_ipv4_netmask_length"></a> [ipv4\_netmask\_length](#input\_ipv4\_netmask\_length) | (Optional) The netmask length of the IPv4 CIDR you want to allocate to this VPC. Requires specifying a ipv4\_ipam\_pool\_id. | `string` | `null` | no |
| <a name="input_ipv6_cidr_block"></a> [ipv6\_cidr\_block](#input\_ipv6\_cidr\_block) | (Optional) IPv6 CIDR block to request from an IPAM Pool. Can be set explicitly or derived from IPAM using ipv6\_netmask\_length. | `string` | `null` | no |
| <a name="input_ipv6_cidr_block_network_border_group"></a> [ipv6\_cidr\_block\_network\_border\_group](#input\_ipv6\_cidr\_block\_network\_border\_group) | (Optional) By default when an IPv6 CIDR is assigned to a VPC a default ipv6\_cidr\_block\_network\_border\_group will be set to the region of the VPC. This can be changed to restrict advertisement of public addresses to specific Network Border Groups such as LocalZones. | `string` | `null` | no |
| <a name="input_ipv6_ipam_pool_id"></a> [ipv6\_ipam\_pool\_id](#input\_ipv6\_ipam\_pool\_id) | (Optional) IPAM Pool ID for a IPv6 pool. Conflicts with assign\_generated\_ipv6\_cidr\_block. | `string` | `null` | no |
| <a name="input_ipv6_netmask_length"></a> [ipv6\_netmask\_length](#input\_ipv6\_netmask\_length) | (Optional) Netmask length to request from IPAM Pool. Conflicts with ipv6\_cidr\_block. This can be omitted if IPAM pool as a allocation\_default\_netmask\_length set. Valid values: 56. | `string` | `null` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | (Optional) Prefix to use in resource naming. | `string` | `""` | no |
| <a name="input_preserve_client_ip"></a> [preserve\_client\_ip](#input\_preserve\_client\_ip) | (Optional) Indicates whether your client's IP address is preserved as the source. | `string` | `true` | no |
| <a name="input_private_subnet_routes"></a> [private\_subnet\_routes](#input\_private\_subnet\_routes) | (optional) Private route rules block.<br>"One of the destination\_cidr\_block or destination\_prefix\_list\_id argument must be supplied:"<br>One of the following target arguments must be supplied:<br>  - carrier\_gateway\_id - Identifier of a carrier gateway. This attribute can only be used when the VPC contains a subnet which is associated with a Wavelength Zone.<br>  - egress\_only\_gateway\_id - Identifier of a VPC Egress Only Internet Gateway.<br>  - nat\_gateway\_id - Identifier of a VPC NAT gateway.<br>  - network\_interface\_id - Identifier of an EC2 network interface.<br>  - transit\_gateway\_id - Identifier of an EC2 Transit Gateway.<br>  - vpc\_endpoint\_id - Identifier of a VPC Endpoint.<br>  - vpc\_peering\_connection\_id - Identifier of a VPC peering connection. | <pre>map(object({<br>    destination_cidr_block     = optional(string, null)<br>    destination_prefix_list_id = optional(string, null)<br>    transit_gateway_id         = optional(string, null)<br>    nat_gateway_id             = optional(string, null)<br>    vpc_endpoint_id            = optional(string, null)<br>    carrier_gateway_id         = optional(string, null)<br>    egress_only_gateway_id     = optional(string, null)<br>    network_interface_id       = optional(string, null)<br>    vpc_peering_connection_id  = optional(string, null)<br>  }))</pre> | `{}` | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | (optional) Private Subnets created within the VPC | <pre>list(object({<br>    name                                           = optional(string)<br>    cidr_block                                     = optional(string)<br>    availability_zone_id                           = optional(string)<br>    availability_zone                              = optional(string)<br>    enable_dns64                                   = optional(bool, null)<br>    enable_resource_name_dns_aaaa_record_on_launch = optional(bool, null)<br>    enable_resource_name_dns_a_record_on_launch    = optional(bool, null)<br>    ipv6_cidr_block                                = optional(string, null)<br>    private_dns_hostname_type_on_launch            = optional(string, null)<br>    private_subnet_tags                            = optional(map(string), {})<br>  }))</pre> | `[]` | no |
| <a name="input_public_subnet_routes"></a> [public\_subnet\_routes](#input\_public\_subnet\_routes) | (optional) Public route rules block.<br>"One of the destination\_cidr\_block or destination\_prefix\_list\_id argument must be supplied:"<br>One of the following target arguments must be supplied:<br>  - carrier\_gateway\_id - Identifier of a carrier gateway. This attribute can only be used when the VPC contains a subnet which is associated with a Wavelength Zone.<br>  - network\_interface\_id - Identifier of an EC2 network interface.<br>  - transit\_gateway\_id - Identifier of an EC2 Transit Gateway.<br>  - vpc\_endpoint\_id - Identifier of a VPC Endpoint.<br>  - vpc\_peering\_connection\_id - Identifier of a VPC peering connection. | <pre>map(object({<br>    destination_cidr_block     = optional(string, null)<br>    destination_prefix_list_id = optional(string, null)<br>    transit_gateway_id         = optional(string, null)<br>    vpc_endpoint_id            = optional(string, null)<br>    carrier_gateway_id         = optional(string, null)<br>    network_interface_id       = optional(string, null)<br>    vpc_peering_connection_id  = optional(string, null)<br>  }))</pre> | `{}` | no |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | (optional) Public Subnets created within the VPC | <pre>list(object({<br>    name                                           = optional(string)<br>    cidr_block                                     = optional(string)<br>    availability_zone_id                           = optional(string)<br>    availability_zone                              = optional(string)<br>    map_public_ip_on_launch                        = optional(bool, true)<br>    assign_ipv6_address_on_creation                = optional(bool, null)<br>    enable_dns64                                   = optional(bool, null)<br>    enable_resource_name_dns_aaaa_record_on_launch = optional(bool, null)<br>    enable_resource_name_dns_a_record_on_launch    = optional(bool, null)<br>    ipv6_cidr_block                                = optional(string, null)<br>    private_dns_hostname_type_on_launch            = optional(string, null)<br>    public_subnet_tags                             = optional(map(string), {})<br>  }))</pre> | `[]` | no |
| <a name="input_region"></a> [region](#input\_region) | (Optional) Region to use in resource naming. | `string` | `"eu-central-1"` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | (Optional) One or more security groups to associate with the endpoint. If you don't specify a security group, the default security group for the VPC will be associated with the endpoint. | `list(string)` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A map of tags to assign to the resource. If configured with a provider default\_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level. | `map(string)` | `{}` | no |
| <a name="input_use_created_igw_for_public_routing"></a> [use\_created\_igw\_for\_public\_routing](#input\_use\_created\_igw\_for\_public\_routing) | (optional) Whether to use IGW created within the module for public route to internet or not? | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_igw_id"></a> [igw\_id](#output\_igw\_id) | Internet gateway Id. |
| <a name="output_private_route_table_id"></a> [private\_route\_table\_id](#output\_private\_route\_table\_id) | Private route table Id. |
| <a name="output_private_subnet_cidr_blocks"></a> [private\_subnet\_cidr\_blocks](#output\_private\_subnet\_cidr\_blocks) | Key value object for private subnet CIDR blocks. |
| <a name="output_private_subnet_ids"></a> [private\_subnet\_ids](#output\_private\_subnet\_ids) | Key value object for private subnet IDs. |
| <a name="output_public_route_table_id"></a> [public\_route\_table\_id](#output\_public\_route\_table\_id) | Public route table Id. |
| <a name="output_public_subnet_cidr_blocks"></a> [public\_subnet\_cidr\_blocks](#output\_public\_subnet\_cidr\_blocks) | Key value object for public subnet CIDR blocks. |
| <a name="output_public_subnet_ids"></a> [public\_subnet\_ids](#output\_public\_subnet\_ids) | Key value object for public subnet IDs. |
| <a name="output_vpc_cidr_block"></a> [vpc\_cidr\_block](#output\_vpc\_cidr\_block) | The VPC CIDR block. |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC. |

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have any suggestion that would make this project better, feel free to  fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement" with your suggestion.

**⭐️ Don't forget to give the project a star! Thanks again! ⭐️**

See [`CONTRIBUTING`](/CONTRIBUTING.md) for more information.

<!-- LICENSE -->
## License

Released under [MIT](/LICENSE) by [@ishuar](https://github.com/ishuar).

<!-- CONTACT -->
## Contact

- 👯 [LinkedIn](https://linkedin.com/in/ishuar)

<p align="right"><a href="#top">Back To Top ⬆️</a></p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[contributors-url]: https://github.com/ishuar/terraform-aws-vpc/graphs/contributors
[contributors-shield]: https://img.shields.io/github/contributors/ishuar/terraform-aws-vpc?style=for-the-badge

[forks-url]: https://github.com/ishuar/terraform-aws-vpc/network/members
[forks-shield]: https://img.shields.io/github/forks/ishuar/terraform-aws-vpc?style=for-the-badge

[stars-url]: https://github.com/ishuar/terraform-aws-vpc/stargazers
[stars-shield]: https://img.shields.io/github/stars/ishuar/terraform-aws-vpc?style=for-the-badge

[issues-url]: https://github.com/ishuar/terraform-aws-vpc/issues
[issues-shield]: https://img.shields.io/github/issues/ishuar/terraform-aws-vpc?style=for-the-badge

[license-url]: https://github.com/ishuar/terraform-aws-vpc/blob/main/LICENSE
[license-shield]: https://img.shields.io/github/license/ishuar/terraform-aws-vpc?style=for-the-badge