terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.14"
    }
  }
}

provider "aws" {
  region = var.region
  default_tags {
    tags = {
      github_repo = "terraform-aws-eks"
      example     = "simple"
    }
  }
}
