# Autoscaling group
resource "aws_autoscaling_group" "baston_asg" {

  name_prefix                 = "baston"
  desired_capacity            = 1
  max_size                    = 2
  min_size                    = 1
  wait_for_capacity_timeout   = 0
  vpc_zone_identifier         = var.public_subnets
  health_check_type           = "EC2"
  target_group_arns           = [aws_lb_target_group.ssh-tg.arn]
  launch_template {
                      id      = aws_launch_template.baston.id
                      version = "$Latest"
  }

}

