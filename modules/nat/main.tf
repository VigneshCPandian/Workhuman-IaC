resource "aws_eip" "eip-nat-a" {
  domain = "vpc"

  tags   = {
    Name = "eip-nat-a"
  }
}

resource "aws_eip" "eip-nat-b" {
  domain = "vpc"

  tags   = {
    Name = "eip-nat-b"
  }
}

resource "aws_nat_gateway" "nat-a" {
  allocation_id = aws_eip.eip-nat-a.id
  subnet_id     = var.pub_sub_1a_id

  tags   = {
    Name = "nat-a"
  }

  depends_on = [var.igw_id]
}

# create nat gateway in public subnet pub-sub-1-a
resource "aws_nat_gateway" "nat-b" {
  allocation_id = aws_eip.eip-nat-b.id
  subnet_id     = var.pub_sub_2b_id

  tags   = {
    Name = "nat-b"
  }

  depends_on = [var.igw_id]
}

resource "aws_route_table" "pri-rt-a" {
  vpc_id            = var.vpc_id

  route {
    cidr_block      = "0.0.0.0/0"
    nat_gateway_id  = aws_nat_gateway.nat-a.id
  }

  tags   = {
    Name = "Pri-rt-a"
  }
}


resource "aws_route_table_association" "pri-sub-3a-with-Pri-rt-a" {
  subnet_id         = var.pri_sub_3a_id
  route_table_id    = aws_route_table.pri-rt-a.id
}


resource "aws_route_table_association" "pri-sub-4b-with-Pri-rt-b" {
  subnet_id         = var.pri_sub_4b_id
  route_table_id    = aws_route_table.pri-rt-a.id
}


resource "aws_route_table" "pri-rt-b" {
  vpc_id            = var.vpc_id

  route {
    cidr_block      = "0.0.0.0/0"
    nat_gateway_id  = aws_nat_gateway.nat-b.id
  }

  tags   = {
    Name = "pri-rt-b"
  }
}

resource "aws_route_table_association" "pri-sub-5a-with-pri-rt-b" {
  subnet_id         = var.pri_sub_5a_id
  route_table_id    = aws_route_table.pri-rt-b.id
}

resource "aws_route_table_association" "pri-sub-6b-with-pri-rt-b" {
  subnet_id         = var.pri_sub_6b_id
  route_table_id    = aws_route_table.pri-rt-b.id
}