
###########################
######### PROJECT #########
###########################
variable "region" {
    description = "AWS service region"
    type = "string"
}

variable "project" {
    description = "Project name"
    type = "string"
}
variable "env" {
    description = "Deployment environment"
    type = "string"
}
variable "profile" {
    description = "AWS service profile"
    type = "string"
}


###########################
########### VPC ###########
###########################
variable "vpc_cidr_block" {
    description = "AWS VPC CIDR block"
    type = "string"
}

variable "public_subnets_cidr_block" {
    description = "AWS VPC public subnet CIDR"
    type = "string"
}

variable "private_subnets_cidr_block" {
    description = "AWS VPC private subnet CIDR"
    type = "string"
}

variable "public_subnet_az" {
    description = "AWS VPC Private Subnet Acailability Zone"
    type = "string"
}

variable "private_subnet_az" {
    description = "AWS VPC Public Subnet Acailability Zone"
    type = "string"
}

###########################
########### RDS ###########
###########################
variable "rds_username" {
    description = "RDS Master username "
    type = "string"
    sensitive = true
}

variable "rds_password" {
    description = "RDS Master password "
    type = "string"
    sensitive = true
}

variable "rds_port" {
    description = "RDS port"
    type = "string"
}

variable "rds_dbname" {
    description = "RDS database name"
    type = "string"
}

variable "rds_db_engine" {
    description = "RDS database engine name"
    type = "string"
}
variable "rds_db_family" {
    description = "RDS database family"
    type = "string"
}

variable "rds_db_version" {
   description = "RDS database version"
   type = "string"
}

variable "rds_maintenance_window" {
    description = "RDS database maintenance period"
    type = "string"
}
