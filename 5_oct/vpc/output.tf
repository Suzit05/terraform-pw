output "public_ip" {
  description = "the public ip address of ec2"
  value = aws_instance.my_instance.public_ip
}

output "instance_id" {
  value = aws_instance.my_instance.id
}

output "bucket_name" {
  value =aws_s3_bucket.my_bucket.bucket
}

output "vpc_id" {
  value = aws_vpc.my_vpc.id
}