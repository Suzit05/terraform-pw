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

resource "aws_security_group" "web_sg" {
  name = "web-sg"
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 80
    to_port = 80
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
resource "aws_instance" "web_remote" {  
  instance_type = var.instance_type
  key_name = var.key_name
  ami = data.aws_ami.amazon_linux.id



  tags = {
    Name = "Provisoner-demo"
  }

}

#provisoing with remote-exec
resource "null_resource" "bootstrap" {
  depends_on = [ aws_instance.web_remote ]
  triggers = {
    instance_id = aws_instance.web_remote.id
    script_hash = filemd5("./scripts/setup.sh")
  }
  provisioner "file" {
    source = "./scripts/setup.sh"
    destination = "/tmp/setup.sh"
    connection {
      type        = "ssh"
      host        = aws_instance.web_remote.public_ip
      user        = "ec2-user"
      private_key = file(var.ssh_private_key_path)
      timeout     = "4m"     
    }
  }
  provisioner "remote-exec" {
    inline = [ 
        "chmod +x /tmp/setup.sh",
        "sudo bash /tmp/setup.sh"
     ]
    connection {
      type        = "ssh"
      host        = aws_instance.web_remote.public_ip
      user        = "ec2-user"
      private_key = file(var.ssh_private_key_path)
      timeout     = "4m"         
    }
  }

}

output "public_ip" {
  value = aws_instance.web_remote.public_ip
}