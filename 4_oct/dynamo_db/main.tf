provider "aws" {
  region = var.region
}

#dont create...pasia lgega

resource "aws_dynamodb_table" "simple_table" {
  name = var.aws_dynamodb_table_name
  hash_key =   var.hash_key
  billing_mode = var.billing_mode

  attribute {
    name = var.attribute_name
    type = "S"
  }

}