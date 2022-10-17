#---/alb---

variable "vpc_id" {}
variable "alb_security_group" {}
variable "subnet_ids" {
  type = list(string)
}
variable "project_name" {}
