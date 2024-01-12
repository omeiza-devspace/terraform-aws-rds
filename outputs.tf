
###########################
########### VPC ###########
###########################
output "vpc_id" {
  value = module.vpc.vpc_id
}

###########################
########### EC2 ###########
###########################



###########################
########### RDS ###########
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


