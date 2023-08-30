output "vpc_id" {
  value       = module.simple_vpc.vpc_id
  description = "VPC ID"
}

output "public_subnet_ids" {
  value       = module.simple_vpc.public_subnet_ids
  description = "Public Subnet IDs"
}

output "public_subnet_cidrs" {
  value       = module.simple_vpc.public_subnet_cidr_blocks
  description = "Public Subnet IDs"
}

output "private_subnet_ids" {
  value       = module.simple_vpc.private_subnet_ids
  description = "Public Subnet IDs"
}

output "private_subnet_cidrs" {
  value       = module.simple_vpc.private_subnet_cidr_blocks
  description = "Public Subnet IDs"
}

output "igw_id" {
  value       = module.simple_vpc.igw_id
  description = "IGW ID"
}
