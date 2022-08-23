variable "ami" {
  type = string
  default = "ami-08df646e18b182346"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "key_name" {
  type = string
  default = "<existing key name in your console>"
}
