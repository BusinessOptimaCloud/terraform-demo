variable "cidr_block_vpc" {
  description = "cidr block for VPC"
  type = string
  default = "10.0.0.0/16"
}

variable "cidr_block_subnet" {
  description = "cidr block for subnet"
  type = string
  default = "10.0.1.0/24"
}

variable "image_id" {
  description = "instance ami id"
  type = string
  default = "ami-08df646e18b182346"
}

variable "instance_type" {
  description = "instance type"
  type = string
  default = "t2.micro"
}

variable "key_name" {
  description = "key for your instance"
  type = string
  default = "visva8"
}

