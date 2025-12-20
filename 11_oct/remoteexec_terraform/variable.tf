variable "region" {
  default = "eu-north-1"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "key_name" {
  default = "test"
}

variable "ssh_private_key_path" {
  default = "./test.pem"
}