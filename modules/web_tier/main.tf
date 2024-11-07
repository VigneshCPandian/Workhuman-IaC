resource "aws_lb" "web_lb" {
  load_balancer_type = "application"
  security_groups    = [var.web_sg_id]
  subnets            = var.public_subnet_ids
}

resource "aws_autoscaling_group" "asg" {
  desired_capacity = var.desired_capacity
  max_size         = var.max_size
  min_size         = var.min_size
  vpc_zone_identifier  = var.public_subnet_ids
  launch_template {
    id      = aws_launch_template.web_lt.id
    version = "$Latest"
  }
}

resource "aws_iam_role" "ec2_role" {
  name               = "ec2-instance-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2-instance-profile"
  role = aws_iam_role.ec2_role.name
}

resource "aws_launch_template" "web_lt" {
  instance_type        = var.instance_type
    iam_instance_profile {
        name = aws_iam_instance_profile.ec2_instance_profile.name
    }
    network_interfaces {
        associate_public_ip_address = true
        security_groups = [var.web_sg_id]
    }
}
