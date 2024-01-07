resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr

  enable_dns_support   = var.support_vpc_dns
  enable_dns_hostnames = var.support_vpc_hostname

  tags = {
    Name = "${var.env}-vpc"
  }
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.env}-igw"
  }
}