provider "aws" {
  region = var.region
}

#aws instance



resource "aws_instance" "aws_instance" {
  instance_type = var.instance_type
  ami = var.ami
  tags = {
    Name = "szinst1"
  }
}





#s3_bucket

resource "aws_s3_bucket" "my_s3_bucket" {
  acl = "private"
  bucket  = "zitsu05-s3-bucket-ind" #uniq
      tags={
        Name ="zitsu05bucket"
        Environment="Dev"
    }
  
}

#s3_object

resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.my_s3_bucket.id
  key = "index.html"
  source = "index.html"  #local file
  content_type = "text/html"
}
