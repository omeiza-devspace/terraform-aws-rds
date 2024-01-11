
###########################
########### VPC ###########
###########################
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnet" {
  value = module.vpc.private_subnet_id
}

output "public_subnet" {
  value = module.vpc.public_subnet_id
}


###########################
########### VPC ###########
###########################
output "rds_endpoint" {
  value = module.rds.rds_endpoint
}


output "rds_sec_group" {
  value = module.rds.rds_security_group
}

output "rds_subnets" {
  value = module.rds.rds_subnet_group
}


output "rds_instance" {
  value = module.rds.rds_instance_id
}


