resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.public_subnet_cidr
  availability_zone = var.public_subnet_az
  map_public_ip_on_launch = true         

  tags = {
       Name = "${var.project}-${var.env}-public-subnet}" 
  }
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.private_subnet_az
  map_public_ip_on_launch = false       

  tags = {
       Name = "${var.project}-${var.env}-private-subnet}" 
  }
}

