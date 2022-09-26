#--/Modules/vpc---
output "project_name" {
  value = var.project_name
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_subnet1_az1" {
  value = aws_subnet.public_subnet_az1.id
}

output "public_subnet1_az2" {
  value = aws_subnet.public_subnet_az2.id
}

output "private_subnet1_az1" {
  value = aws_subnet.private_data_subnet_az1.id
}

output "private_subnet1_az2" {
  value = aws_subnet.private_data_subnet_az2.id
}

output "internet_gateway" {
  value = aws_internet_gateway.internet_gateway
}

output "subnet_ids" {
  value = [aws_subnet.public_subnet_az1.id, aws_subnet.public_subnet_az2.id]
}

