###########################
########### RDS VPC ###########
###########################
output "rds_vpc_id" {
  value       = var.aws_vpc_id
  description = "The ID of the VPC"
}

output "rds_instance_id" {
  value = aws_db_instance.this.id
  description = "The ID of the RDS instance"
}

output "rds_endpoint" {
  value = aws_db_instance.this.endpoint
}


output "rds_subnet_group" {
  value       = aws_db_subnet_group.this.name
  description = "RDS Subnet Group for DB"
}

output "rds_security_group" {
  value       = aws_security_group.this.id
  description = "The ID of the RDS security group"
}

output "rds_subnets" {
  description = "CIDR range for RDS subnets"
  value       = aws_db_subnet_group.this.name
}

output "rds_security_groups" {
  description = "RDS subnet security groups"
  value       = aws_security_group.this.name
}


