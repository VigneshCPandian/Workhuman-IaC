output "vpc_id" { value = module.vpc.vpc_id }
output "public_subnet_ids" { value = module.vpc.public_subnet_ids }
output "private_db_subnet_ids" { value = module.vpc.private_db_subnet_ids }
output "web_lb_dns" { value = module.web_tier.web_lb_dns }
output "db_endpoint" { value = module.db_tier.db_endpoint }
