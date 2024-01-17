
# set up the Network
module "vpc" {
  source = "./modules/vpc"

  env     = var.env
  project = var.project

  support_vpc_dns      = true
  support_vpc_hostname = true

  azs                  = ["eu-west-1a", "eu-west-1b"]
  vpc_cidr_block       = "10.0.0.0/16"
  private_subnets      = ["10.0.1.0/24", "10.0.2.0/24"]
}

#ec2_connect_endpoint
module "eic" {
  source = "./modules/eic_connect"
  depends_on = [module.vpc]

  env     = var.env
  project = var.project
  aws_vpc_id        = module.vpc.vpc_id

  subnet_id          = module.vpc.private_subnets[0]
}

# set up the Database
module "rds" {
  source     = "./modules/rds"
  depends_on = [module.eic]

  env     = var.env
  project = var.project

  custom_sec_grps = module.eic.security_group_ids

  aws_vpc_id        = module.vpc.vpc_id
  db_engine         = var.rds_db_engine
  db_engine_version = var.rds_db_version
  db_engine_family  = var.rds_db_engine

  is_multi_az           = true
  db_subnet_group_ids   = module.vpc.private_subnets
  db_name               = var.rds_dbname
  db_port               = var.rds_port
  db_maintenance_window = var.rds_maintenance_window

  db_username = "rdsAwsMyAdmin"
}


# connect to ec2_connect_endpoint
resource "null_resource" "ec2_connect_endpoint" {
  depends_on = [module.rds]

  provisioner "local-exec" {
    command     = "aws eks update-kubeconfig --region ${var.region} --name ${module.eks.eks_name}"
    interpreter = ["/bin/bash", "-c"]
  }
}