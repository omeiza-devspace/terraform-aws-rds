###########################
######### PROJECT #########
###########################
variable "region" {
  description = "AWS service region"
  type        = string
}

variable "project" {
  description = "Project name"
  type        = string
}
variable "env" {
  description = "Deployment environment"
  type        = string
}
variable "profile" {
  description = "AWS service profile"
  type        = string
}


###########################
########### RDS ###########
###########################
variable "rds_port" {
  description = "RDS port"
  type        = string
}

variable "rds_dbname" {
  description = "RDS database name"
  type        = string
}

variable "rds_db_engine" {
  description = "RDS database engine name"
  type        = string
}
variable "rds_db_family" {
  description = "RDS database family"
  type        = string
}

variable "rds_db_version" {
  description = "RDS database version"
  type        = string
}

variable "rds_maintenance_window" {
  description = "RDS database maintenance period"
  type        = string
}

