terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region # Use variable for the region
}

# Create a VPC
resource "aws_vpc" "scdoa" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = var.vpc_name
  }
}

# Public Subnets
resource "aws_subnet" "scdoa_public_subnet1" {
  vpc_id            = aws_vpc.scdoa.id
  cidr_block        = var.public_subnet1_cidr
  availability_zone = var.availability_zone1

  tags = {
    Name = var.public_subnet1_name
  }
}

resource "aws_subnet" "scdoa_public_subnet2" {
  vpc_id            = aws_vpc.scdoa.id
  cidr_block        = var.public_subnet2_cidr
  availability_zone = var.availability_zone2

  tags = {
    Name = var.public_subnet2_name
  }
}

# Private Subnets
resource "aws_subnet" "scdoa_private_subnet1" {
  vpc_id            = aws_vpc.scdoa.id
  cidr_block        = var.private_subnet1_cidr
  availability_zone = var.availability_zone1

  tags = {
    Name = var.private_subnet1_name
  }
}

resource "aws_subnet" "scdoa_private_subnet2" {
  vpc_id            = aws_vpc.scdoa.id
  cidr_block        = var.private_subnet2_cidr
  availability_zone = var.availability_zone2

  tags = {
    Name = var.private_subnet2_name
  }
}

# Internet Gateway
resource "aws_internet_gateway" "scdoa_gw" {
  vpc_id = aws_vpc.scdoa.id

  tags = {
    Name = var.internet_gateway_name
  }
}

# Public Route Table
resource "aws_route_table" "scdoa_public_route" {
  vpc_id = aws_vpc.scdoa.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.scdoa_gw.id
  }

  tags = {
    Name = var.public_route_table_name
  }
}

# Associate Public Subnets with the Route Table
resource "aws_route_table_association" "scdoa_public_subnet1_association" {
  subnet_id      = aws_subnet.scdoa_public_subnet1.id
  route_table_id = aws_route_table.scdoa_public_route.id
}

resource "aws_route_table_association" "scdoa_public_subnet2_association" {
  subnet_id      = aws_subnet.scdoa_public_subnet2.id
  route_table_id = aws_route_table.scdoa_public_route.id
}

# Private Route Table
resource "aws_route_table" "scdoa_private_route" {
  vpc_id = aws_vpc.scdoa.id

  tags = {
    Name = var.private_route_table_name
  }
}

# Associate Private Subnets with the Private Route Table
resource "aws_route_table_association" "scdoa_private_subnet1_association" {
  subnet_id      = aws_subnet.scdoa_private_subnet1.id
  route_table_id = aws_route_table.scdoa_private_route.id
}

resource "aws_route_table_association" "scdoa_private_subnet2_association" {
  subnet_id      = aws_subnet.scdoa_private_subnet2.id
  route_table_id = aws_route_table.scdoa_private_route.id
}

# NAT Gateway
## Elastic IP for NAT Gateway
resource "aws_eip" "scdoa_nat_eip" {
  vpc = true

  tags = {
    Name = var.nat_eip_name
  }
}

## NAT Gateway
resource "aws_nat_gateway" "scdoa_nat_gateway" {
  allocation_id = aws_eip.scdoa_nat_eip.id
  subnet_id     = aws_subnet.scdoa_public_subnet1.id

  tags = {
    Name = var.nat_gateway_name
  }
}

# Private Route Table Update
resource "aws_route" "scdoa_private_route_update" {
  route_table_id         = aws_route_table.scdoa_private_route.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.scdoa_nat_gateway.id
}
