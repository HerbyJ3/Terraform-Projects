#--/asg-variables---
variable "instance_type" {
  type        = string
  description = "Defines the instance type"
}

variable "imagge_id" {
  
  description = "Defines the image id"
}

variable "key_name" {
  type        = string
  description = "Defines the key name"
}

variable "project_name" {
  type        = string
  description = "Defines the project name"
}

variable "public_subnet1_az1" {
  type        = string
  description = "Defines the subnet 1 via output vpc"
}

variable "public_subnet1_az2" {
  type        = string
  description = "Defines the subnet 2 via output vpc"
}

variable "target_group_arn" {
  description = "Defines the target group via output"
}

variable "load_balancer" {
  type        = string
  description = "Defines the load balancer"
}

variable "ec2_security_group" {
  
  description = "Defines the load balancer"
}
