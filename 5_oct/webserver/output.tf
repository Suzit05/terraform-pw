output "instance_id" {
  description = "the instance id of web address"
  value = aws_instance.web.id
}

output "public_ip" {
  description = "the ip address of web"
  value = aws_instance.web.public_ip
}