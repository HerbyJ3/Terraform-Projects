#---/Modules/database---

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
variable "database-security-group" {}

variable "private_subnet1_az1" {}
variable "private_subnet1_az2" {}

