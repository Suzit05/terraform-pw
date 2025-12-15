provider "aws" {
  region = var.region

}

resource "aws_instance" "web" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [ aws_security_group.web_sg.id ]
  #continue from here...
  tags = {
    Name = "web-ec2"
  }
}