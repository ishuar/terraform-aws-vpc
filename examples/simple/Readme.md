# Simple VPC

Configuration in this directory creates VPC and dynamic public and private subnets.

This configuration gives you the building blocks for a VPC and subnets. However, note that it doesn't handle the routing aspects. This serves as a fundamental setup for VPC and subnet creation. Only Public Subnet and respective routes are cosidered.

For a comprehensive view of all the options available and more advanced configurations, check out the [complete](../complete) example in the repository. It will provide you with a deeper understanding of how to tailor the VPC and subnets to your specific needs.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Destroying Resources

To destroy the resources created by this Terraform configuration, run the following command.

```bash
terraform destroy -auto-approve # ignore "-auto-approve" if you don't want to autoapprove.
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~>5.14 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_simple_vpc"></a> [simple\_vpc](#module\_simple\_vpc) | ../../ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_region"></a> [region](#input\_region) | (optional) AWS Region where resource would be deployed. | `string` | `"eu-central-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_igw_id"></a> [igw\_id](#output\_igw\_id) | IGW ID |
| <a name="output_private_subnet_cidrs"></a> [private\_subnet\_cidrs](#output\_private\_subnet\_cidrs) | Public Subnet IDs |
| <a name="output_private_subnet_ids"></a> [private\_subnet\_ids](#output\_private\_subnet\_ids) | Public Subnet IDs |
| <a name="output_public_subnet_cidrs"></a> [public\_subnet\_cidrs](#output\_public\_subnet\_cidrs) | Public Subnet IDs |
| <a name="output_public_subnet_ids"></a> [public\_subnet\_ids](#output\_public\_subnet\_ids) | Public Subnet IDs |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | VPC ID |

## License

MIT License. See [LICENSE](https://github.com/ishuar/terraform-aws-vpc/blob/main/LICENSE) for full details.