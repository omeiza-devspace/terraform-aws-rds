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
##### EIC Parameters ######
###########################
variable "subnet_id" {
  description = "The ID of the subnet in which to create the EC2 Instance Connect Endpoint"
  type        = string
}

variable "preserve_client_ip" {
  description = "Indicates whether your client's IP address is preserved as the source"
  type        = bool
  default     = true
}
