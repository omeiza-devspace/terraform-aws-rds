## VPC
resource "aws_vpc" "this" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"
  enable_dns_support   = var.support_vpc_dns
  enable_dns_hostnames = var.support_vpc_hostname

  tags = {
    Name = "${var.env}-VPC"
  }
}

## VPC Internet Gateway
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "${var.project}-IGW"
  }
}


resource "aws_subnet" "private" {
  count             = length(var.private_subnets)
  vpc_id            = aws_vpc.this.id
  cidr_block        = element(var.private_subnets, count.index)
  availability_zone = element(var.azs, count.index)
  map_public_ip_on_launch = false
  
  tags = { 
      Name = "${var.env}-private-subnet-${count.index + 1}"
  }
}
