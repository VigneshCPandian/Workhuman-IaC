resource "aws_launch_template" "vm_template" {
  name_prefix   = "vm-template-"
  instance_type = var.instance_type
  key_name      = var.key_name
  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [var.security_group_id]
  }
}

resource "aws_autoscaling_group" "vm_asg" {
  desired_capacity     = 2
  max_size             = 5
  min_size             = 2
  vpc_zone_identifier  = var.subnets
  target_group_arns    = [var.load_balancer_target_group_arn]

  launch_template {
    id      = aws_launch_template.vm_template.id
    version = "$Latest"
  }
}
