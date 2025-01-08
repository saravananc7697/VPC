# VPC ID
output "vpc_id" {
  description = "The ID of the created VPC"
  value       = aws_vpc.scdoa.id
}

# Public Subnet IDs
output "public_subnet1_id" {
  description = "The ID of public subnet 1"
  value       = aws_subnet.scdoa_public_subnet1.id
}

output "public_subnet2_id" {
  description = "The ID of public subnet 2"
  value       = aws_subnet.scdoa_public_subnet2.id
}

# Private Subnet IDs
output "private_subnet1_id" {
  description = "The ID of private subnet 1"
  value       = aws_subnet.scdoa_private_subnet1.id
}

output "private_subnet2_id" {
  description = "The ID of private subnet 2"
  value       = aws_subnet.scdoa_private_subnet2.id
}

# Internet Gateway ID
output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.scdoa_gw.id
}

# Route Table IDs
output "public_route_table_id" {
  description = "The ID of the public route table"
  value       = aws_route_table.scdoa_public_route.id
}

output "private_route_table_id" {
  description = "The ID of the private route table"
  value       = aws_route_table.scdoa_private_route.id
}

# NAT Gateway ID
output "nat_gateway_id" {
  description = "The ID of the NAT Gateway"
  value       = aws_nat_gateway.scdoa_nat_gateway.id
}

# Elastic IP
output "nat_eip" {
  description = "The Elastic IP of the NAT Gateway"
  value       = aws_eip.scdoa_nat_eip.public_ip
}
