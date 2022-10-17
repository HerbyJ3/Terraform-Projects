terraform {
  backend "s3" {
    bucket = "mybucketforterraformtesting718"
    key    = "state/terraform.tfstate"
    region = "us-east-1"
  }
}



module "vpc" {
  source                  = "./vpc"
  project_name            = var.project_name
  vpc_cidr                = var.vpc_cidr
  public_subnet1_az1_cidr = var.public_subnet1_az1_cidr
  public_subnet2_az2_cidr = var.public_subnet2_az2_cidr


}

module "security-group" {
  source = "./security-group"
  vpc_id = module.vpc.vpc_id


}

module "asg" {
  source             = "./asg"
  instance_type      = var.instance_type
  imagge_id           = var.imagge_id
  key_name           = var.key_name
  public_subnet1_az1 = module.vpc.public_subnet1_az1
  public_subnet1_az2 = module.vpc.public_subnet1_az2
  load_balancer      = module.alb.load_balancer
  target_group_arn   = module.alb.target_group_arn
  project_name       = var.project_name
  ec2_security_group = module.security-group.ec2_security_group

}

module "alb" {
  source             = "./alb"
  vpc_id             = module.vpc.vpc_id
  subnet_ids         = module.vpc.subnet_ids
  project_name       = var.project_name
  alb_security_group = module.security-group.alb_security_group

}
    