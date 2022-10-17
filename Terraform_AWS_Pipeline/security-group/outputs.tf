#---/Modules/security-group---

output "alb_security_group" {
  value = aws_security_group.alb_security_group.id
}

output "ssh_security_group" {
  value = aws_security_group.ssh-security-group.id
}

output "ec2_security_group" {
  value = aws_security_group.ec2_security_group.id
}
