terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 1.3.0"
}

provider "aws" {
  profile = "default"
  region  = "us-west-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"
  user_data     = <<EOF
  #!/bin/bash
  sudo apt update -y
  sudo apt install apache2 -y
  sudo systemctl start apache2
  sudo systemctl status apache2
  EOF

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
