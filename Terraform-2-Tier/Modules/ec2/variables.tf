#---/Modules/ec2---

variable "ami" {}
variable "instance_type" {}
variable "ec2_web_tag_name" {}
variable "keyname" {}
variable "ec2_security_group" {}
variable "subnet_ids" {
  type = list(string)
}
