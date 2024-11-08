output "load_balancer_dns_name" {
  value = module.load_balancer.load_balancer_dns_name
}

output "db_endpoint" {
  value = module.db.db_endpoint
}
