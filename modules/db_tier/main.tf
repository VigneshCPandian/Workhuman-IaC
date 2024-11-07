resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "workhuman-db-subnet-group"
  subnet_ids = var.private_subnet_ids
}

resource "aws_db_instance" "db_instance" {
  identifier           = "workhuman-db"
  engine               = "mysql"
  instance_class       = var.db_instance_class
  allocated_storage    = 20
  username             = var.db_username
  password             = var.db_password
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
  multi_az             = true
  vpc_security_group_ids = [var.db_sg_id]
  storage_encrypted    = true
}

resource "aws_security_group" "db_sg" {
  vpc_id = var.vpc_id
}