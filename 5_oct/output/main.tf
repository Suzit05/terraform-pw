provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "my_instance" {
  ami = "ami-0fa91bc90632c73c9" #ami-0fa91bc90632c73c9
  instance_type = "t3.micro"
  tags = {
    Name = "Terraform-ec2-ubuntu"
  }
}

output "instance_id" {
  value = aws_instance.my_instance.id
}

output "public_ip" {
  value = aws_instance.my_instance.public_ip
}

output "public_dns" {
  value = aws_instance.my_instance.public_dns
}

output "subnet_id" {
  value = aws_instance.my_instance.subnet_id
}

output "private_ip" {
  value = aws_instance.my_instance.private_ip
}

output "availability_zone" {
  value = aws_instance.my_instance.availability_zone
}