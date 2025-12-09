provider "aws" {
  region = var.region
}

resource "aws_instance" "my_ec2" {
  instance_type = var.instance_type
  ami = var.ami
  tags = {
    Name = "szinst1"
  }
  
}