## !! Comment this configuration in your Local environment. !!

terraform {
  backend "s3" {
    bucket         = "ishuar-terraform"
    encrypt        = true
    key            = "terraform-aws-vpc/simple/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "ishuar"
  }
}
