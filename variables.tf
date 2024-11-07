variable "environment" {
  description = "The environment for which to deploy resources (e.g., dev, staging, prod)"
  type        = string
}

variable "vpc_cidr" {}

variable "web_subnet_cidrs" {
    type = list(string)
}
variable "db_subnet_cidrs" {
    type = list(string)
}

variable "web_instance_type" {
    default = "t3.medium"
}

variable "web_desired_capacity" {
    default = 2
}

variable "web_max_size" {
    default = 5
}

variable "web_min_size" {
    default = 2
}

variable "db_instance_class" {
    default = "db.t3.medium"
}

variable "db_username" {}

variable "db_password" {}

