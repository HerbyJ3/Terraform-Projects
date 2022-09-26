#---/Modules/database---

resource "aws_db_subnet_group" "db_subnet" {
  name       = "dbsubnet"
  subnet_ids = [var.private_subnet1_az1, var.private_subnet1_az2]

  tags = {
    Name = "dbsubnet"
  }
}

resource "aws_db_instance" "mysql" {
  identifier          = var.identifier
  engine              = var.engine
  engine_version      = var.engine_version
  instance_class      = "db.t3.micro"
  allocated_storage   = 20
  skip_final_snapshot = true

  db_name  = var.db_name
  username = var.username
  password = var.password

  vpc_security_group_ids = [var.database-security-group]

  db_subnet_group_name = aws_db_subnet_group.db_subnet.name


}
