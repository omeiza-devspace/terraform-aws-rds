###########################
# VPC
###########################
variable "vpc_cidr" {
  type        = string
  description = "vpc cidr"
}

variable "env" {
  type        = string
  description = "environment name"
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
