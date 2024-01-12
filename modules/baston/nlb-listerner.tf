resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = aws_lb.nlb.arn
  port              = 22
  protocol          = "TCP"
  default_action {
    target_group_arn = aws_lb_target_group.ssh-tg.arn
    type             = "forward"
  }
}

