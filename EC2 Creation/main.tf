terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "demo_instance" {
  ami = var.ami
  instance_type = var.instance_type
  availability_zone = "ap-south-1b"
  key_name = var.key_name

  tags = {
    Name = "Business optima"
  }
}
