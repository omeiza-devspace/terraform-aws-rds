## Security Group for EIC 
resource "aws_security_group" "this" {
  name        = "${var.project}-${var.env}-eic-sg"
  description = "Allow inbound traffic"
  vpc_id      = var.aws_vpc_id

  ingress {
    description = "Allow ssh access via"
    from_port   = 22
    to_port     = 22
    protocol    = "ssh"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow access via specified port"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description     = "eic egress"
  }

  tags = {
    Name = "${var.project}-${var.env}-rds-sec-grp"
  }
}

resource "aws_ec2_instance_connect_endpoint" "this" {
  subnet_id          = var.subnet_id
  security_group_ids = [aws_security_group.this.id]
  preserve_client_ip = var.preserve_client_ip

  tags = {
    Name = "${var.project}-${var.env}-eic-sec-grp"
  }
}







