
###########################
########## BASTON #########
###########################

output "baston_security_group_id" {
  value = aws_security_group.bastion-allow-ssh.id
}



