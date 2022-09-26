#---/Modules/ec2---

output "aws_instance" {
  value = aws_instance.app_server
}
