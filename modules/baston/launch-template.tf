resource "aws_launch_template" "baston" {
  name = "baston"
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      volume_size = 20
    }
  }
  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  credit_specification {
    cpu_credits = "standard"
  }

# This refers to termination Protection
  disable_api_termination = true

  image_id = var.ami_id
  key_name = aws_key_pair.this.key_name
  instance_initiated_shutdown_behavior = "stop"


  instance_type = "t2.micro"
  monitoring {
    enabled = true
  }
  network_interfaces {
    associate_public_ip_address = true
    subnet_id                   = var.baston_template_subnet_id
    security_groups = [aws_security_group.bastion-allow-ssh.id]
  }
  placement {
    availability_zone = "eu-west-2a"   # We need to be able to handle multiple AZs
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
        "Name"           = "baston-launch-template",
        "Managed By"     = "Terraform",
        "Resource"       = "LaunchTemplate",
        "Project"        = "${var.project}"
    }
  }
  user_data = filebase64("${path.module}/launch-template.sh")
}