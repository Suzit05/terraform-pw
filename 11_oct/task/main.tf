terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
#note --------------------worked , but unable to reach the site, try remoteexec for this , everything ok
provider "aws" {
  region = var.region
}

data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_security_group" "web_sg1" {
  name = "web-sg"
  description = "allow ssh , http , jenkins"
  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
#creating instance

resource "aws_instance" "web_ubuntu" {
  instance_type = var.instance_type
  ami           = data.aws_ami.ubuntu.id
  key_name      = var.key_name

  user_data_replace_on_change = true

  user_data = <<-EOF
    #!/bin/bash
    set -e

    if [ ! -f /etc/jenkins_init_done ]; then
      apt-get update -y
      apt-get install -y fontconfig openjdk-17-jre curl gnupg

      curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key \
        | tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

      echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian-stable binary/" \
        | tee /etc/apt/sources.list.d/jenkins.list > /dev/null

      apt-get update -y
      apt-get install -y jenkins
      
      systemctl enable jenkins
      systemctl start jenkins

      touch /etc/jenkins_init_done
    fi
  EOF

  tags = {
    Name = "web-ubuntu"
  }
}


output "public_ip" {
  value = aws_instance.web_ubuntu.public_ip
}
