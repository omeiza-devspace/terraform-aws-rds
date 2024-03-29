###########################
######## Gerneral ##########
###########################
variable "env" {
  description = "environment name"
  type        = string
}

variable "project" {
  description = "project name"
  type        = string
}

variable "aws_vpc_id" {
  description = "Specifies VPC ID"
  type        = string
}

###########################
##### DB Parameters #######
###########################
variable "custom_sec_grps" {
  description = "One or more security groups to associate with the endpoint"
  type        = list(string)
}

variable "db_engine" {
  description = "database engine type"
  type        = string
}

variable "db_engine_version" {
  description = "database engine version"
  type        = string
}

variable "db_engine_family" {
  description = "database engine family"
  type        = string
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
}

variable "db_username" {
  description = "Specifies if the RDS instance is multi-AZ"
  type        = string
#  sensitive   = true
}

variable "db_port" {
  description = "Specifies if the RDS access port"
  type        = string
}

variable "db_maintenance_window" {
  description = "Specifies database maintainance duration window"
  type = string
}

variable "enabled_ssm_parameter_store" {
  type        = bool
  default     = true
  description = "Save RDS credentials to SSM Parameter Store."
}


