variable "vpc_cidr" {}
variable "web_subnet_cidrs" {}
variable "db_subnet_cidrs" {}
variable "environment" {
  description = "The environment for which to deploy resources (e.g., dev, staging, prod)"
  type        = string
}