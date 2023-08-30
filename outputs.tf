output "vpc_id" {
  value       = aws_vpc.this.id
  description = "The ID of the VPC."
}

output "vpc_cidr_block" {
  value       = aws_vpc.this.cidr_block
  description = "The VPC CIDR block."
}

output "public_subnet_ids" {
  value = {
    for k, v in aws_subnet.public_subnet : k => v.id
  }
  description = "Key value object for public subnet IDs."
}

output "public_subnet_cidr_blocks" {
  value = {
    for k, v in aws_subnet.public_subnet : k => v.cidr_block
  }
  description = "Key value object for public subnet CIDR blocks."
}

output "private_subnet_ids" {
  value = {
    for k, v in aws_subnet.private_subnet : k => v.id
  }
  description = "Key value object for private subnet IDs."

}

output "private_subnet_cidr_blocks" {
  value = {
    for k, v in aws_subnet.private_subnet : k => v.cidr_block
  }
  description = "Key value object for private subnet CIDR blocks."
}

output "igw_id" {
  value       = try(aws_internet_gateway.this[0].id, null)
  description = "Internet gateway Id."
}

output "private_route_table_id" {
  value       = try(aws_route_table.private[0].id, null)
  description = "Private route table Id."
}

output "public_route_table_id" {
  value       = try(aws_route_table.public[0].id, null)
  description = "Public route table Id."
}
