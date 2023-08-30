module "simple_vpc" {
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
    # {
    #   name              = "subnet02"
    #   cidr_block        = "10.1.3.0/24"
    # }
  ]

  private_subnets = [
    {
      name              = "subnet01"
      cidr_block        = "10.1.2.0/24"
      availability_zone = "${var.region}a"
    },
    # {
    #   name              = "subnet02"
    #   cidr_block        = "10.1.4.0/24"
    # }
  ]
}
