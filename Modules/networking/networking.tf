
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  tags = merge(
    { "Environment" = var.environment_name },
    { "Name" = format("vpc-${var.environment_name}") },
    var.additional_tags
  )
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = merge(
    { "Environment" = var.environment_name },
    { "Name" = format("internet-gateway-${var.environment_name}") },
    var.additional_tags
  )
}

resource "aws_subnet" "public_subnets" {
  count = length(var.availability_zones)

  vpc_id            = aws_vpc.vpc.id
  cidr_block        = element(var.public_subnets_cidr_blocks, count.index)
  availability_zone = var.availability_zones[count.index]

  tags = merge(
    { "Environment" = var.environment_name },
    { "Name" = format("${var.public_subnet_interfix}-subnet-${count.index}-${var.environment_name}") },
    { "Type" = var.public_subnet_interfix },
    var.additional_tags
  )
}

resource "aws_route_table" "route_table_public_subnets" {
  count = length(var.public_subnets_cidr_blocks)

  vpc_id = aws_vpc.vpc.id

  tags = merge(
    { "Environment" = var.environment_name },
    { "Name" = format("${var.public_subnet_interfix}-route-table-${count.index}-${var.environment_name}") },
    var.additional_tags
  )
}

resource "aws_route" "default_route_public_subnet_ip4" {
  count = length(var.public_subnets_cidr_blocks)

  route_table_id         = element(aws_route_table.route_table_public_subnets[*].id, count.index)
  destination_cidr_block = var.default_route_ip4
  gateway_id             = aws_internet_gateway.internet_gateway.id
  depends_on             = [aws_internet_gateway.internet_gateway]
}

resource "aws_route_table_association" "route_table_association_public_subnet" {
  count = length(var.public_subnets_cidr_blocks)

  subnet_id      = element(aws_subnet.public_subnets[*].id, count.index)
  route_table_id = element(aws_route_table.route_table_public_subnets[*].id, count.index)
}

resource "aws_eip" "nat_eip" {
  count = length(var.public_subnets_cidr_blocks)

  vpc        = true
  depends_on = [aws_internet_gateway.internet_gateway]

  tags = merge(
    { "Environment" = var.environment_name },
    { "Name" = format("elastic-ip-${count.index}-${var.environment_name}") },
    var.additional_tags
  )
}

resource "aws_nat_gateway" "nat_gateway" {
  count = 1 #length(var.public_subnets_cidr_blocks)

  allocation_id = element(aws_eip.nat_eip[*].id, count.index)
  subnet_id     = element(aws_subnet.public_subnets[*].id, count.index)
  depends_on    = [aws_internet_gateway.internet_gateway]

  tags = merge(
    { "Environment" = var.environment_name },
    { "Name" = format("nat-gateway-${count.index}-${var.environment_name}") },
    var.additional_tags
  )
}

resource "aws_subnet" "private_subnets" {
  count = length(var.availability_zones)

  vpc_id            = aws_vpc.vpc.id
  cidr_block        = element(var.private_subnets_cidr_blocks, count.index)
  availability_zone = var.availability_zones[count.index]

  tags = merge(
    { "Environment" = var.environment_name },
    { "Name" = format("${var.private_subnet_interfix}-subnet-${count.index}-${var.environment_name}") },
    { "Type" = var.private_subnet_interfix },
    var.additional_tags
  )
}

resource "aws_route_table" "route_table_private_subnets" {
  count = length(var.private_subnets_cidr_blocks)

  vpc_id = aws_vpc.vpc.id

  tags = merge(
    { "Environment" = var.environment_name },
    { "Name" = format("${var.private_subnet_interfix}-route-table-${count.index}-${var.environment_name}") },
    var.additional_tags
  )
}

resource "aws_route" "default_route_private_subnet_ip4" {
  count = 1 #length(var.private_subnets_cidr_blocks)

  route_table_id         = element(aws_route_table.route_table_private_subnets[*].id, count.index)
  destination_cidr_block = var.default_route_ip4
  nat_gateway_id         = element(aws_nat_gateway.nat_gateway[*].id, count.index)
  depends_on             = [aws_nat_gateway.nat_gateway]
}

resource "aws_route_table_association" "route_table_association" {
  count = length(var.private_subnets_cidr_blocks)

  subnet_id      = element(aws_subnet.private_subnets[*].id, count.index)
  route_table_id = element(aws_route_table.route_table_private_subnets[*].id, count.index)
}

