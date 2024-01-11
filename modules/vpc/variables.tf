###########################
########### TAGS ##########
###########################
variable "env" {
  type        = string
  description = "environment name"
}

variable "project" {
  type        = string
  description = "project name"
}

###########################
########### VPC ###########
###########################
variable "vpc_cidr_block" {
  type        = string
  description = "vpc ip range"
}


###########################
#### Availability Zones ###
###########################

variable "public_subnet_az" {
  description = "AZ for public subnets"
  type        = string
}

variable "private_subnet_az" {
  description = "AZ for private subnets"
  type        = string
}

###########################
######## Subnets CIDR ##########
###########################

variable "public_subnet_cidr" {
  description = "CIDR for private subnets"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR for private subnets"
  type        = string
}
