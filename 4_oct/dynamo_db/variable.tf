variable "region" {
  default = "eu-north-1"
}



variable "aws_dynamodb_table_name" {
  default = "my-dynamodb-table"
}

variable "billing_mode" {
  default = "PAY-PER-REQUEST"
}

variable "hash_key" {
  default = "id"
}

variable "attribute_name" {
  default = "id"
  type = "S"
}

