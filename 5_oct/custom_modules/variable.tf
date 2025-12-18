variable "region" {
  default = "eu-north-1"
}

variable "vpc_name" {
  default = "my-terraform-vpc"
}

variable "cidr_blocks" {
  description = "CIDR blocks for the VPC"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}