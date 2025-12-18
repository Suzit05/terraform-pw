provider "aws" {
  region = var.region
}
module "my_vpc" {
    source = "./modules/vpc"
    cidr_block = var.cidr_blocks[0]
    
}

output "vpc_id" {
  value = module.my_vpc.vpc_id
}

output "vpc_cidr" {
  value = var.cidr_blocks
}