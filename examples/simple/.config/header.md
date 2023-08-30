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
