#---/root---

#create vpc
module "vpc" {
  source                   = "./Modules/vpc"
  project_name             = var.project_name
  vpc_cidr                 = var.vpc_cidr
  public_subnet1_az1_cidr  = var.public_subnet1_az1_cidr
  public_subnet2_az2_cidr  = var.public_subnet2_az2_cidr
  private_subnet1_az1_cidr = var.private_subnet1_az1_cidr
  private_subnet2_az2_cidr = var.private_subnet2_az2_cidr

}

module "security-group" {
  source = "./Modules/security-group"
  vpc_id = module.vpc.vpc_id
}

#create an ec2 instance
module "Ec2" {
  source             = "./Modules/ec2"
  ami                = var.ami
  instance_type      = var.instance_type
  ec2_web_tag_name   = var.ec2_web_tag_name
  keyname            = var.keyname
  ec2_security_group = module.security-group.ec2_security_group
  subnet_ids         = module.vpc.subnet_ids

}

#create a RDS database instance

module "database" {
  source                  = "./Modules/database"
  identifier              = var.identifier
  engine                  = var.engine
  engine_version          = var.engine_version
  db_name                 = var.db_name
  username                = var.username
  password                = var.password
  database-security-group = module.security-group.database-security-group
  private_subnet1_az1     = module.vpc.private_subnet1_az1
  private_subnet1_az2     = module.vpc.private_subnet1_az2

}

#create an application load balancer

module "alb" {
  source             = "./Modules/alb"
  vpc_id             = module.vpc.vpc_id
  alb_security_group = module.security-group.alb_security_group
  subnet_ids         = module.vpc.subnet_ids
  aws_instance       = module.Ec2.aws_instance
  project_name       = var.project_name

}



