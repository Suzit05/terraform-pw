variable "region" {
  default = "eu-north-1"
}

variable "s3_bucket_name" {
  description = "The name of s3 bucket"
  type = string
  default = "my-zitsu-05-bucket"
}