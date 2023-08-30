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
