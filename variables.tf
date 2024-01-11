
## Project Variables
variable "region" {}
variable "project" {}
variable "env" {}
variable "profile" {}


## VPC variables
variable "vpc_cidr_block" {}
variable "public_subnets_cidr_block" {}
variable "private_subnets_cidr_block" {}
variable "public_subnet_az" {}
variable "private_subnet_az" {}

## RDS Variables
variable "rds_username" {}
variable "rds_password" {}
variable "rds_port" {}
variable "rds_dbname" {}
variable "rds_db_engine" {}
variable "rds_db_family" {}
variable "rds_db_version" {}
variable "rds_maintenance_window" {}
