region                   = "us-east-1"
project_name             = "LUIT-week-18"
vpc_cidr                 = "10.0.0.0/16"
public_subnet1_az1_cidr  = "10.0.1.0/24"
public_subnet2_az2_cidr  = "10.0.2.0/24"
private_subnet1_az1_cidr = "10.0.3.0/24"
private_subnet2_az2_cidr = "10.0.4.0/24"
ami                      = "ami-0309aede310b9cc1f"
instance_type            = "t2.micro"
ec2_web_tag_name         = "week_18"
keyname                  = "VirginiaKey"
identifier               = "db-mysql"
engine                   = "mysql"
engine_version           = "8.0.27"
db_name                  = "dbmysql"
username                 = "user"
password                 = "password"