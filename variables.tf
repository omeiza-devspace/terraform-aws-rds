variable "aws_region" {
  description = "Region in which AWS Resources will be created"
  type        = string
  default     = "eu-west-1"
}

variable "is_multi_az" {
  description = "Specifies if the RDS instance is multi-AZ"
  type        = bool
  default     = true
}

variable "identifier_name" {
  description = "Specifies if the RDS instance is multi-AZ"
  type        = string
  default     = "mysql-demo-db"
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