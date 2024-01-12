data "aws_ami" "linux_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name = "name"
    values = [
      "amzn2-ami-kernel-*-hvm-*-x86_64-gp2"
    ]
  }
}

## VPC variables
locals {
  available_azs   = ["eu-west-1a", "eu-west-1b"]

  vpc_cidr_block  = "10.0.0.0/16"

  public_subnets  =  ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.14.0/24", "10.0.15.0/24"]
}

# set up the Network
module "vpc" {
  source = "./modules/vpc"

  env     = var.env
  project = var.project

  support_vpc_dns      = true
  support_vpc_hostname = true

  vpc_cidr_block = local.vpc_cidr_block

  azs                  = local.available_azs
  private_subnet_cidrs = local.private_subnets
  public_subnet_cidrs  = local.public_subnets
}

# set up the Baston
module "baston" {
  source     = "./modules/baston"
  depends_on = [module.vpc]

  env     = var.env
  project = var.project

  vpc_id                         = module.vpc.vpc_id
  baston_template_subnet_id      = module.vpc.public_subnets[0]
  ami_id                         = data.aws_ami.linux_ami.id
  key_pair_file_path             = var.pubkey_file_path

  public_subnets = module.vpc.public_subnets
}

# set up the Database
module "rds" {
  source     = "./modules/rds"
  depends_on = [module.baston]

  env     = var.env
  project = var.project

  bastion_sec_grp_id = module.baston.baston_security_group_id

  aws_vpc_id        = module.vpc.vpc_id
  db_engine         = var.rds_db_engine
  db_engine_version = var.rds_db_version
  db_engine_family  = var.rds_db_engine

  is_multi_az         = true
  db_subnet_group_ids = module.vpc.private_subnets
  db_name             = var.rds_dbname
  db_port               = var.rds_port
  db_maintenance_window = var.rds_maintenance_window

  db_username           = var.rds_username
  db_password           = var.rds_password
}


