locals {
  global_cidr = "0.0.0.0/0"
}

# create public route
resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = local.global_cidr
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name = "${var.env}-public-route"
  }
}

# associate  public route to public subnet
resource "aws_route_table_association" "public_subnets_az_associations" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_route.id
}

 



