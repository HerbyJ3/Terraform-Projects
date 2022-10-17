#---/vpc---
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
