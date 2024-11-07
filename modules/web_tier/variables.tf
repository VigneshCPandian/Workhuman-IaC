variable "web_sg_id" {}
variable "public_subnet_ids" {
  
}
variable "desired_capacity" {
  
}
variable "max_size" {
  
}
variable "min_size" {
  
}
variable "instance_type" {
  
}
variable "iam_instance_profile" {
  description = "IAM Instance Profile for EC2 instances"
  type        = string
}
variable "security_groups" {
  
}
variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}