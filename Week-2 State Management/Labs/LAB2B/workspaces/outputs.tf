output "instance_public_ip" {
  value = aws_instance.web-1.public_ip
}

output "instance_id" {
  value = aws_instance.web-1.id
}