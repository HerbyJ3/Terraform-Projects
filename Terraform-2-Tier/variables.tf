#---/root---

#vpc
variable "project_name" {
  type        = string
  description = "This configures the vpc name"
}
variable "vpc_cidr" {
  type        = string
  description = "This configures the vpc cidr"
}
variable "public_subnet1_az1_cidr" {
  type        = string
  description = "This configures the public subnet1 cidr"
}
variable "public_subnet2_az2_cidr" {
  type        = string
  description = "This configures the public subnet2 cidr"
}
variable "private_subnet1_az1_cidr" {
  type        = string
  description = "This configures the private subnet1 cidr"
}
variable "private_subnet2_az2_cidr" {
  type        = string
  description = "This configures the private subnet2 cidr"
}

#ec2
variable "ami" {}
variable "instance_type" {}
variable "ec2_web_tag_name" {}
variable "keyname" {}

#database
variable "identifier" {}
variable "engine" {}
variable "engine_version" {}
variable "db_name" {}
variable "username" {
  sensitive = true
}
variable "password" {
  sensitive = true
}





