resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
}

resource "aws_subnet" "public" {
  count                   = length(var.web_subnet_cidrs)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.web_subnet_cidrs[count.index]
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private_db" {
  count      = length(var.db_subnet_cidrs)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.db_subnet_cidrs[count.index]
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
}

resource "aws_security_group" "web_sg" {
  vpc_id = aws_vpc.main.id
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_security_group" "db_sg" {
  vpc_id = aws_vpc.main.id
    ingress {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        security_groups = [aws_security_group.web_sg.id]
    }
}
