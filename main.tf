provider "aws" {
  region                   = var.aws_region
  profile                  = "default"
  shared_credentials_files = ["~/.aws/credentials"]
}

resource "aws_vpc" "this" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "eu-west-1a" # Update with your desired AZ
  map_public_ip_on_launch = true         # Map public IP addresses to instances in this subnet
}

resource "aws_subnet" "private" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "eu-west-1b" # Update with your desired AZ
  map_public_ip_on_launch = false        # Map public IP addresses to instances in this subnet

  tags = {
    Name = "dev"
  }
}

resource "aws_db_subnet_group" "this" {
  name       = "this-subnet-group"
  subnet_ids = [aws_subnet.public.id, aws_subnet.private.id]

  tags = {
    Name = "dev"
  }
}

resource "aws_security_group" "this" {
  name        = "mysql-access"
  description = "This security group for RDS"
  vpc_id      = aws_vpc.this.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "dev"
  }
}

resource "aws_db_parameter_group" "this" {
  name   = "mysql-db"
  family = "mysql-dev"

  parameter {
    name  = "log_connections"
    value = "1"
  }

  tags = {
    Name = "dev"
  }
}

resource "aws_db_instance" "this" {
  identifier          = var.identifier_name
  allocated_storage   = 20
  storage_type        = "gp2"
  engine              = "mysql"
  engine_version      = "5.7"
  instance_class      = "db.t2.micro"
  username            = var.db_username
  password            = var.db_password
  publicly_accessible = true
  skip_final_snapshot = true
  multi_az            = var.is_multi_az # Enable Multi-AZ deployment

  # Specify the desired DB subnet group
  db_subnet_group_name = aws_db_subnet_group.this.name

  # Specify the VPC security group(s)
  vpc_security_group_ids = [aws_security_group.this.id]

  # Specify the DB parameter group
 # db_parameter_group_name = aws_db_parameter_group.this.name

  tags = {
    Name = "dev"
  }
}



