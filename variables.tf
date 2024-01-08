variable "aws_region" {
    description = "Region in which AWS Resources will be created"
    type = string
    default = "eu-west-1"
}

variable "multi_az" {
  description = "Specifies if the RDS instance is multi-AZ"
  type        = bool
  default     = true
}

variable "name" {
  description = "Specifies if the RDS instance is multi-AZ"
  type        = string
  default     = "demo"
}