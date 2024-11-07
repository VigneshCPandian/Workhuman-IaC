module "vpc" {
  source           = "./modules/vpc"
  environment      = var.environment
  vpc_cidr         = var.vpc_cidr
  web_subnet_cidrs = var.web_subnet_cidrs
  db_subnet_cidrs  = var.db_subnet_cidrs
}

module "web_tier" {
  source                = "./modules/web_tier"
  vpc_id                = module.vpc.vpc_id
  public_subnet_ids     = module.vpc.public_subnet_ids
  instance_type         = var.web_instance_type
  desired_capacity      = var.web_desired_capacity
  max_size              = var.web_max_size
  min_size              = var.web_min_size
  iam_instance_profile  = aws_iam_instance_profile.ec2_instance_profile.name
  web_sg_id             = module.vpc.web_sg_id
  security_groups       = aws_security_group.web_sg.id
}

module "db_tier" {
  source              = "./modules/db_tier"
  vpc_id              = module.vpc.vpc_id
  private_subnet_ids  = module.vpc.private_db_subnet_ids
  db_instance_class   = var.db_instance_class
  db_username         = var.db_username
  db_password         = var.db_password
  db_sg_id            = module.vpc.db_sg_id
}
