

## Security Group for RDS 
resource "aws_security_group" "this" {
  name        = "${var.project}-${var.env}-db-sg"
  description = "Security group for RDS ${var.db_engine}"
  vpc_id      = var.aws_vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description     = "${var.db_engine} ingress"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description     = "${var.db_engine} egress"
  }

  tags = {
    Name = "${var.project}-${var.env}-sec-grp"
  }
}