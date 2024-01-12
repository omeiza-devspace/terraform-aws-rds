resource "aws_lb" "nlb" {
  name               = "${var.project}-nlb"
  internal           = false
  load_balancer_type = "network"
  subnets            = var.public_subnets

  enable_deletion_protection = false

  tags = {
        "Name"           = "${var.project}-baston-nlb",
        "Managed By"     = "Terraform",
        "Resource"       = "NLB",
        "Project"        = "${var.project}"
    }
}