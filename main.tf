data "aws_availability_zones" "available_azs" {
  state = "available"
}

# set up the Network
module "vpc" {
  source = "./modules/vpc"

  env     = var.env
  project = var.project

  vpc_cidr_block = var.vpc_cidr_block

  public_subnet_cidr  = var.public_subnets_cidr_block
  private_subnet_cidr = var.private_subnets_cidr_block

  public_subnet_az  = var.public_subnet_az
  private_subnet_az = var.private_subnet_az
}

# set up the Database
module "rds" {
  source     = "./modules/rds"
  depends_on = [module.vpc]

  env     = var.env
  project = var.project

  aws_vpc_id          = module.vpc.vpc_id
  db_engine           = var.rds_db_engine
  db_engine_version   = var.rds_db_version
  db_engine_family   = var.rds_db_engine

  is_multi_az         = true
  db_subnet_group_ids = [module.vpc.public_subnet_id, module.vpc.private_subnet_id]
  db_name             = var.rds_dbname
  db_username         = var.rds_username

  db_password           = var.rds_password
  db_port               = var.rds_port
  db_maintenance_window = var.rds_maintenance_window
}


