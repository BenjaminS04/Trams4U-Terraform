data "aws_availability_zones" "available" {
  state = "available"
}

# NETWORKING #

resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = { Name = "${var.naming_prefix}-vpc" }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = { Name = "${var.naming_prefix}-igw" }
}

resource "aws_subnet" "public_subnet" {
  count                  = var.vpc_public_subnet_count
  cidr_block              = "10.0.${count.index}.0/24"
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = { Name = "${var.naming_prefix}-public-subnet-${count.index}" }
}

# ROUTING #

resource "aws_route_table" "rtb" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = { Name = "${var.naming_prefix}-rt" }
}

resource "aws_route_table_association" "rtb_association" {
  count          = var.vpc_public_subnet_count
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.rtb.id
}