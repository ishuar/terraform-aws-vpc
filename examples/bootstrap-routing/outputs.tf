output "vpc_id" {
  value       = module.bootstrap_routing_vpc.vpc_id
  description = "VPC ID"
}

output "public_subnet_ids" {
  value       = module.bootstrap_routing_vpc.public_subnet_ids
  description = "Public Subnet IDs"
}

output "public_subnet_cidrs" {
  value       = module.bootstrap_routing_vpc.public_subnet_cidr_blocks
  description = "Public Subnet IDs"
}

output "private_subnet_ids" {
  value       = module.bootstrap_routing_vpc.private_subnet_ids
  description = "Public Subnet IDs"
}

output "private_subnet_cidrs" {
  value       = module.bootstrap_routing_vpc.private_subnet_cidr_blocks
  description = "Public Subnet IDs"
}

output "igw_id" {
  value       = module.bootstrap_routing_vpc.igw_id
  description = "IGW ID"
}

output "private_route_table_id" {
  value = module.bootstrap_routing_vpc.private_route_table_id
  description = "Private Route Table ID"
}

output "public_route_table_id" {
  value = module.bootstrap_routing_vpc.public_route_table_id
  description = "Public Route Table ID"
}
