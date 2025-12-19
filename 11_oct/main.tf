terraform {
  required_providers {
    aws={source = "hashicorp/aws"}
  }
}

provider "aws" {
  region = var.region
}

data "aws_ami" "amazon_linux"{ #to get the ami 
    most_recent = true
    owners = ["amazon"]
    filter {
      name = "name"
      values = ["amzn2-ami-hvm-*-x86_64-gp2"]
    }

}

#creating instance with nginx installed (using shebang  )
resource "aws_instance" "web_userdata" {  
  instance_type = var.instance_type
  key_name = var.key_name
  ami = data.aws_ami.amazon_linux.id

  user_data = <<-EOF
        #!/bin/bash
        if [! -f /etc/web_init_done]; then
            yum update -y
            yum install -y nginx
            systemctl enable nginx
            systemctl start nginx
            touch /etc/web_init_done
        fi
    EOF

  tags = {
    Name = "web-${terraform.workspace}"
  }

}