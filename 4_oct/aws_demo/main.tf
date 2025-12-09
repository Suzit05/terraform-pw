provider "aws" {
    region = "eu-north-1"
}

resource "aws_instance" "server1" {
    count= 3 # to create multiple instances
    ami           = "ami-0360c520857e3138f" # Amazon Linux 2 AMI
    instance_type = "t3.micro"

    tags = {
        Name = "skpin-${count.index + 1}"
    }
}