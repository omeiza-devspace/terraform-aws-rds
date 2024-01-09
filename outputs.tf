output "vpc_id" {
  value = aws_vpc.this.id
}

output "rds_endpoint" {
  value = aws_db_instance.this.endpoint
}

output "db_subnet_group_name" {
  value = aws_db_subnet_group.this.name
}


output "public_subnet" {
  value = aws_subnet.public.id
}

output "private_subnet" {
  value = aws_subnet.private.id
}

output "db_parameter_group" {
  value = aws_db_parameter_group.this.name
}

output "db_instance_name" {
  value = aws_db_instance.this.identifier
}