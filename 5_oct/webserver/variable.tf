variable "ami" {
  default = "ami-0fa91bc90632c73c9"
}

variable "region" {
  default = "eu-north-1"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "key_name" {
  type = string
}