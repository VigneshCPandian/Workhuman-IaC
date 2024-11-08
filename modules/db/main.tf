resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "db_subnet_group"
  subnet_ids = var.subnets

  tags = {
    Name = "db_subnet_group"
  }
}

resource "aws_db_instance" "db_instance" {
  identifier               = var.db_identifier
  engine                   = "postgres"
  instance_class           = "db.t2.micro"
  allocated_storage        = 20
  name                     = var.db_name
  username                 = var.db_username
  password                 = var.db_password
  db_subnet_group_name     = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids   = [var.security_group_id]
  skip_final_snapshot      = true
  publicly_accessible      = false

  tags = {
    Name = "db_instance"
  }
}
