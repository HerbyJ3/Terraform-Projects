#---/Modules/alb---

variable "vpc_id" {}
variable "alb_security_group" {}
variable "subnet_ids" {
  type = list(string)
}
variable "aws_instance" {}
variable "project_name" {}
