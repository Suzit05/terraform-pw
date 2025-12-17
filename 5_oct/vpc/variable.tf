variable "region" {
  default = "eu-north-1"
}

variable "ami" {
  default = "ami-0fa91bc90632c73c9"
  
}

variable "instance_type" {
  default = "t3.micro"
}

variable "bucket_name" {
  default = "aws-sz-bucket"
}

variable "Environment" {
  default = "development"
}