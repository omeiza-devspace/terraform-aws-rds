output "vpc_id" {
  value = aws_vpc.this.id
}

output "rds_endpoint" {
  value = aws_db_instance.this.endpoint
}

output "db_subnet_group_name" {
  value = aws_db_subnet_group.this.name
}