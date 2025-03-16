module "vpc" {
  source       = "./modules/vpc"
  cidr_block   = var.vpc_cidr_block
}

module "ec2" {
  source        = "./modules/ec2"
  instance_type = var.instance_type
  vpc_id        = module.vpc.vpc_id
}

module "rds" {
  source         = "./modules/rds"
  db_username    = var.db_username
  db_password    = var.db_password
  vpc_id         = module.vpc.vpc_id
}

module "s3" {
  source        = "./modules/s3"
}

module "security" {
  source = "./modules/security"
}
