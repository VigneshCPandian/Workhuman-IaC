variable "private_subnet_ids" {}
variable "db_instance_class" {}
variable "db_username" {}
variable "db_password" {}
variable "db_sg_id" {}
variable "vpc_id" {
  description = "The VPC ID where the database tier will be deployed"
  type        = string
}