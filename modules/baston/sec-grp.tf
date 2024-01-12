## EC2 Bastion Host Security Group
resource "aws_security_group" "bastion-allow-ssh" {
  name        = "${var.env}-baston-sg"
  description = "Allow ssh inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "ssh access from public"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "IPv4 route Open to Public Internet"
  }

  tags = {
    Name = "${var.project}-${var.env}-allow-ssh-to-baston"
  }
}








