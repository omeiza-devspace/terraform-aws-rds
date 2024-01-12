###########################
######## Gerneral #########
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
########## EC2  ##########
###########################
variable "key_pair_file_path" {
  description = "SSH keypair file to connect to the worker nodes"
  type        = string
}

variable "vpc_id" {
  description = "VPC the resource is attached to"
  type        = string
}

variable "public_subnets" {
  description = "Public subnet of the resources"
  type        = list(string)
}


variable "baston_template_subnet_id" {
  description = "Launch template subnet"
  type        = string
}


variable "ami_id" {
  description = "AMI for the baston host"
  type        = string
}