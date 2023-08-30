
locals {
  enable_private_routing = var.create_private_route_table
  route_to_igw           = length(var.public_subnet) > 0 && var.use_created_igw_for_public_routing
}

resource "aws_route_table" "private" {
  count = local.enable_private_routing ? 1 : 0

  vpc_id = aws_vpc.this.id
  tags = merge(var.tags,
    {
      Name = "${var.prefix}-${var.env}-bootstrap-private-rt-${var.region}"
  })
}

resource "aws_route_table" "public" {
  count = length(var.public_subnet) > 0 ? 1 : 0

  vpc_id = aws_vpc.this.id
  tags = merge(var.tags,
    {
      Name = "${var.prefix}-${var.env}-bootstrap-public-rt-${var.region}"
  })
}

resource "aws_route" "private" {
  for_each = local.enable_private_routing ? var.private_routes : {}

  route_table_id             = aws_route_table.private[0].id
  destination_cidr_block     = each.value.destination_cidr_block
  destination_prefix_list_id = each.value.destination_prefix_list_id
  transit_gateway_id         = each.value.transit_gateway_id
  nat_gateway_id             = each.value.nat_gateway_id
  vpc_endpoint_id            = each.value.vpc_endpoint_id
  carrier_gateway_id         = each.value.carrier_gateway_id
  egress_only_gateway_id     = each.value.egress_only_gateway_id
  network_interface_id       = each.value.network_interface_id
  vpc_peering_connection_id  = each.value.vpc_peering_connection_id
}

resource "aws_route" "public" {
  for_each = length(var.public_subnet) > 0 ? var.public_routes : {}

  route_table_id             = aws_route_table.public[0].id
  destination_cidr_block     = each.value.destination_cidr_block
  destination_prefix_list_id = each.value.destination_prefix_list_id
  gateway_id                 = local.route_to_igw ? aws_internet_gateway.this[0].id : each.value.gateway_id
  egress_only_gateway_id     = each.value.egress_only_gateway_id
}

resource "aws_route_table_association" "private" {
  for_each       = { for subnet in var.private_subnet : subnet.name => subnet if local.enable_private_routing }
  subnet_id      = aws_subnet.private_subnet[(each.value.name)].id
  route_table_id = aws_route_table.private[0].id
}

resource "aws_route_table_association" "public" {
  for_each       = { for subnet in var.public_subnet : subnet.name => subnet if(length(var.public_subnet) > 0) }
  subnet_id      = aws_subnet.public_subnet[(each.value.name)].id
  route_table_id = aws_route_table.public[0].id
}

