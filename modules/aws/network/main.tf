resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name        = "vpc-${var.environment}"
    Environment = var.environment
  }
}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "igw-${var.environment}"
  }
}
resource "aws_subnet" "network_subnets" {
  for_each = var.subnets_config
  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone
  map_public_ip_on_launch = each.value.is_public
  tags = {
    Name = "subnet-${each.key}"
    Type = each.value.is_public ? "Public" : "Private"
  }
}
resource "aws_eip" "nat" {
  for_each = { for k, v in var.subnets_config : v.availability_zone => k if v.is_public }
  domain = "vpc"
  tags = {
    Name = "main-nat-${each.key}-eip"
  }
}
resource "aws_nat_gateway" "pubnat" {
  for_each = {for k, v in var.subnets_config : v.availability_zone => k if v.is_public}
  allocation_id = aws_eip.nat[each.key].id
  subnet_id     = aws_subnet.network_subnets[each.value].id # Must be a public subnet
  tags = {
    Name = "main-nat-${each.value}-gateway"
  }
  depends_on = [aws_internet_gateway.gw]
}
resource "aws_route_table" "private_nat_rt" {
  for_each = {
    for k, v in var.subnets_config : k => v if v.needs_nat
  }
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.pubnat[each.value.availability_zone].id
  }
  tags = {
    Name = "rt-${each.key}"
  }
}
resource "aws_route_table_association" "private_nat_assoc" {
  for_each = {
    for k, v in var.subnets_config : k => aws_subnet.network_subnets[k] if v.needs_nat
  }
  subnet_id      = each.value.id
  route_table_id = aws_route_table.private_nat_rt[each.key].id
}