variable "region" {
  default = "eu-north-1"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "key_name" {
  description = "existing aws pair name ti use for ssh"
  default  = "test" #key from aws
}