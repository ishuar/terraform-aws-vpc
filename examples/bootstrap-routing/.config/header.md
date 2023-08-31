# Bootstrap Routing VPC

Configuration in this directory creates following components

- VPC
- Public and Private Subnets as defined.
- Nat Gateway and respective Elastic IP out of module scope.
- Public and Private Route Tables.
- Default route to internet Gateway for Public Subnets.
- Default route to nat gateway in private subnets.

Routing has to be adjusted as required.

## Usage

To run this example you need to execute:
```bash
$ terraform init
$ terraform plan
$ terraform apply
```
>>**INFO:** :warning: Please comment or update the backend.tf configuration accordingly in your local set up :waning:

## Destroying Resources

To destroy the resources created by this Terraform configuration, run the following command.

```bash
terraform destroy -auto-approve # ignore "-auto-approve" if you don't want to autoapprove.
```
