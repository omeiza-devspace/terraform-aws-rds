## Security Group for RDS 
resource "aws_security_group" "this" {
  name        = "${var.project}-${var.env}-db-sg"
  description = "Allow access inbound traffic"
  vpc_id      = var.aws_vpc_id

  ingress {
    description = "allow ssh access from baston"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [ var.bastion_sec_grp_id ]
  }

   ingress {
    description = "Allow access from baston"
    from_port   = var.db_port
    to_port     = var.db_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description     = "${var.db_engine} egress"
  }

  tags = {
    Name = "${var.project}-${var.env}-rds-sec-grp"
  }
}

## KMS Key for RDS Postgres
resource "aws_kms_key" "db_key" {
  description         = "KMS key for RDS ${var.project}-${var.env}"
  key_usage           = "ENCRYPT_DECRYPT"
  enable_key_rotation = true
}

## RDS Subnet Group for DB
resource "aws_db_subnet_group" "this" {
  name        = "rds db subnet group"
  description = "rds private subnet group"
  subnet_ids  = var.db_subnet_group_ids

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "${var.project}-${var.env}-db-subnet-grp"
  }
}


## RDS DB Instance for RDS
resource "aws_db_instance" "this"{
  identifier                            = "mydb"
  engine                                = "${var.db_engine}"
  engine_version                        = "${var.db_engine_version}"
  instance_class                        = "db.t4g.large"
  allocated_storage                     = 20
  max_allocated_storage                 = 100
  storage_type                          = "gp2"
  storage_encrypted                     = true
  kms_key_id                            = aws_kms_key.db_key.arn
  db_name                               = var.db_name
  username                              = var.db_username
  password                              = var.db_password
  port                                  = var.db_port
  multi_az                              = "${var.is_multi_az}"
  network_type                          = "IPV4"
  db_subnet_group_name                  = aws_db_subnet_group.this.id
  vpc_security_group_ids                = [aws_security_group.this.id] # receive as input from vpc module
  deletion_protection                   = false
  allow_major_version_upgrade           = false
  auto_minor_version_upgrade            = true
  apply_immediately                     = true
  backup_retention_period               = 30
  backup_window                         = "21:00-23:00"
  maintenance_window                    = var.db_maintenance_window
  copy_tags_to_snapshot                 = true
  delete_automated_backups              = true
  #enabled_cloudwatch_logs_exports       = [ "postgres", "upgrade"]
  performance_insights_enabled          = true
  performance_insights_kms_key_id       = aws_kms_key.db_key.arn
  performance_insights_retention_period = 7
  publicly_accessible                   = false
  #parameter_group_name                  = aws_db_parameter_group.this.id
  skip_final_snapshot                   = true
  final_snapshot_identifier             = "${var.project}-db-final-snapshot-${var.env}"

  tags = {
    Name = "${var.project}-${var.env}-db-instance"
  }
}


