variable "project_name" {
  type        = string
  description = "This defines the bucket name for the project name"
}

variable "vpc_cidr" {
  type        = string
  description = "This defines the bucket name for the vpc cidr"
}

variable "public_subnet1_az1_cidr" {
  type        = string
  description = "This defines the cidr for subnet1"
}

variable "public_subnet2_az2_cidr" {
  type        = string
  description = "This defines the cidr subnet2"
}

variable "instance_type" {
  type        = string
  description = "This defines the instance type for the asg"
}

variable "imagge_id" {
  
  description = "This defines the image id for the asg"
}

variable "key_name" {
  type        = string
  description = "This defines the existing keyname for the instance asg"
}

variable "region" {
  type        = string
  description = "This defines the region"
}