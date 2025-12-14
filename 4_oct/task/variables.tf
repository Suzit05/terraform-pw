variable "region" {
    default = "eu-north-1"
}

variable "ami" {
  default = "ami-0b46816ffa1234887"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "aws_dynamodb_table_name" {
    default = "sz-dynamo"
  
}

variable "billing_mode" {
  default = "PAY_PER_REQUEST"
}

variable "hash_key" {
  default = "id"
}

variable "attribute_name" {
  type    = string
  default = "id"
}

variable "s3_bucket_name" {
  description = "The name of s3 bucket"
  type = string
  default = "my-zitsu-05-bucket-dj"
}