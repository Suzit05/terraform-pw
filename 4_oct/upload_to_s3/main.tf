provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "zitsu-05-bucket"
  acl = "private"

  tags = {
    name = "Mydemobucket"
    environment= "Dev"
  }
}

resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.my_bucket.id
  key = "index.html"
  source = "index.html"  #local file
  content_type = "text/html"
}