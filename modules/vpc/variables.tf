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

variable "support_vpc_dns" {
  type        = bool
  description = "enable dns support in vpc"
  default     = true
}

variable "support_vpc_hostname" {
  type        = bool
  description = "nable hostname support in vpc"
  default     = true
}

###########################
#### Availability Zones ###
###########################

variable "azs" {
  description = "Availability Zones"
  type        = list(string)
}

###########################
###### Subnets CIDR #######
###########################

variable "public_subnet_cidrs" {
  description = "CIDR for private subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "CIDR for private subnets"
  type        = list(string)
}
