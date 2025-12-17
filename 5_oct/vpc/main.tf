provider "aws" {
  region = var.region
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "myVPC"
  }
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
  acl = "private"
  tags = {
    Name = var.bucket_name
    Environment = var.Environment
  }
}

resource "aws_instance" "my_instance" {
  ami = var.ami
  instance_type = var.instance_type
  tags = {
    Name = "myterra-ec2"
  }
}