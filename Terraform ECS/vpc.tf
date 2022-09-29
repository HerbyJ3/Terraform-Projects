# create vpc
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "${var.project_name}-vpc"
  }
}
# use data source to get all avalablility zones in region
data "aws_availability_zones" "available_zones" {}

# create public subnet az1
resource "aws_subnet" "private_subnet_az1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnet1_az1_cidr
  availability_zone = data.aws_availability_zones.available_zones.names[0]


  tags = {
    Name = "private subnet1"
  }
}

# create public subnet az2
resource "aws_subnet" "private_subnet_az2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnet2_az2_cidr
  availability_zone = data.aws_availability_zones.available_zones.names[1]


  tags = {
    Name = "private subnet2"
  }
}  