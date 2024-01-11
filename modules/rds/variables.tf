###########################
######## Gerneral ##########
###########################
variable "env" {
  type        = string
  description = "environment name"
}

variable "project" {
  type        = string
  description = "project name"
}

variable "aws_vpc_id" {
  type        = string
  description = "Specifies VPC ID"
}


###########################
##### DB Parameters #######
###########################
variable "db_engine" {
  type        = string
  description = "database engine type"
  default     = "mysql"
}

variable "db_engine_version" {
  type        = string
  description = "database engine version"
  default     = "5.7"
}

variable "db_engine_family" {
  type        = string
  description = "database engine family"
  default     = "5.7"
}

## RDS variables
variable "is_multi_az" {
  description = "Specifies if the RDS instance is multi-AZ"
  type        = bool
  default     = true
}

variable "db_subnet_group_ids" {
  description = "Specifies if the RDS subnets for multi-AZ"
  type        = list(string)
}

variable "db_name" {
  description = "Specifies the RDS name of the db"
  type        = string
  default     = "demo-db"
}

variable "db_username" {
  description = "Specifies if the RDS instance is multi-AZ"
  type        = string
  default     = "dbAdmin"
}

variable "db_password" {
  description = "Specifies if the RDS instance is multi-AZ"
  type        = string
  default     = "password234-1"
}

variable "db_port" {
  description = "Specifies if the RDS access port"
  type        = string
  default     = "3306"
}

variable "db_maintenance_window" {
  description = "Specifies database maintainance duration window"
  type = string
}

variable "email_endpoint" {
  description = "Specifies SNS email address"
  type        = string
  default     = "admin@localhost.com"
}



