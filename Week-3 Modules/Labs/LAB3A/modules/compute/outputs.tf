output "ec2_instance_ip" {
  value = aws_instance.web.public_ip
}