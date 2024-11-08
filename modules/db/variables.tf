variable "vpc_id" {
  type = string
}

variable "subnets" {
  type = list(string)
}

variable "db_identifier" {
  type = string
}

variable "db_name" {
  type = string
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type      = string
  sensitive = true
}

variable "security_group_id" {
  type = string
}
