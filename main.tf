# set up the VPC
module "vpc" {
  source   = "./modules/vpc"
  env      = var.env
  vpc_cidr = var.vpc_cidr

  support_vpc_dns      = true
  support_vpc_hostname = true
}