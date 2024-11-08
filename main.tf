# VPC module
module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = "10.0.0.0/16"
}

# Security Group module
module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
}

# Load Balancer module
module "load_balancer" {
  source        = "./modules/load_balancer"
  vpc_id        = module.vpc.vpc_id
  subnets       = module.vpc.public_subnet_ids
  security_group_id = module.security_group.sg_id
}

# Autoscaling Group module
module "autoscaling" {
  source                 = "./modules/autoscaling"
  subnets                = module.vpc.public_subnet_ids
  security_group_id      = module.security_group.sg_id
  load_balancer_target_group_arn = module.load_balancer.target_group_arn
  instance_type          = "t2.micro"
  key_name               = "my-key"
}

# Database Module
module "db" {
  source              = "./modules/db"
  vpc_id              = module.vpc.vpc_id
  subnets             = module.vpc.private_subnet_ids
  db_identifier       = "enterprise-db"
  db_name             = "enterprise_db"
  db_username         = "admin"
  db_password         = var.db_password
  security_group_id   = module.security_group.db_sg_id
}

output "load_balancer_dns_name" {
  value = module.load_balancer.load_balancer_dns_name
}

output "db_endpoint" {
  value = module.db.db_endpoint
}
