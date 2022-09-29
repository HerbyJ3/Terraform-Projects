
terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"

    }
    aws = {
      source = "hashicorp/aws"

    }
  }
}

provider "docker" {}

provider "aws" {
  region = var.region
}