variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  type    = string
  default = "my-key"
}

variable "db_password" {
  description = "The password for the database"
  type        = string
  sensitive   = true
}
