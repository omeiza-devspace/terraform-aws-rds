
###########################
########### VPC ###########
###########################
output "vpc_id" {
  value = module.vpc.vpc_id
}

###########################
########### EIC ###########
###########################
##output "cmd" {
  ##description = "The AWS cli command to connect to your EC2 instance through the connect point"
  ##value       = "aws --region ${split(":", module.ec2_instance.arn)[3]} ec2-instance-connect ssh --instance-id ${split("/", module.ec2_instance.arn)[1]}"
##}



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



