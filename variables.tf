# AWS Region
variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

# VPC
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = "my-scdoa-vpc"
}

# Subnets
variable "public_subnet1_cidr" {
  description = "The CIDR block for public subnet 1"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnet2_cidr" {
  description = "The CIDR block for public subnet 2"
  type        = string
  default     = "10.0.2.0/24"
}

variable "private_subnet1_cidr" {
  description = "The CIDR block for private subnet 1"
  type        = string
  default     = "10.0.3.0/24"
}

variable "private_subnet2_cidr" {
  description = "The CIDR block for private subnet 2"
  type        = string
  default     = "10.0.4.0/24"
}

variable "availability_zone1" {
  description = "Availability Zone 1"
  type        = string
  default     = "us-east-1a"
}

variable "availability_zone2" {
  description = "Availability Zone 2"
  type        = string
  default     = "us-east-1b"
}

# Tags and Names
variable "public_subnet1_name" {
  description = "Name for public subnet 1"
  type        = string
  default     = "my-scdoa-public-subnet1"
}

variable "public_subnet2_name" {
  description = "Name for public subnet 2"
  type        = string
  default     = "my-scdoa-public-subnet2"
}

variable "private_subnet1_name" {
  description = "Name for private subnet 1"
  type        = string
  default     = "my-scdoa-private-subnet1"
}

variable "private_subnet2_name" {
  description = "Name for private subnet 2"
  type        = string
  default     = "my-scdoa-private-subnet2"
}

variable "internet_gateway_name" {
  description = "Name for the Internet Gateway"
  type        = string
  default     = "my-scdoa-gw"
}

variable "public_route_table_name" {
  description = "Name for the public route table"
  type        = string
  default     = "my-scdoa-public-route"
}

variable "private_route_table_name" {
  description = "Name for the private route table"
  type        = string
  default     = "my-scdoa-private-route"
}

variable "nat_eip_name" {
  description = "Name for the Elastic IP for NAT Gateway"
  type        = string
  default     = "my-scdoa-nat-eip"
}

variable "nat_gateway_name" {
  description = "Name for the NAT Gateway"
  type        = string
  default     = "my-scdoa-nat-gateway"
}
