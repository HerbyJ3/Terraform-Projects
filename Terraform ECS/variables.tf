variable "region" {
  description = "name region"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  type        = string
  description = "This configures the vpc cidr"
  default     = "10.0.0.0/16"
}

variable "project_name" {
  type        = string
  description = "This configures the project name"
  default     = "ecs-fargate"
}

variable "private_subnet1_az1_cidr" {
  type        = string
  description = "This configures the public subnet1 cidr"
  default     = "10.0.1.0/24"
}

variable "private_subnet2_az2_cidr" {
  type        = string
  description = "This configures the public subnet2 cidr"
  default     = "10.0.2.0/24"
}

variable "name_prefix" {
  type        = string
  description = "This configures a name variable to name other resources"
  default     = "week19test"
}