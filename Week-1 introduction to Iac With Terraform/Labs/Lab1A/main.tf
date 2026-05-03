
# This Terraform configuration file sets up an AWS EC2 instance using the latest Amazon Linux 2023 AMI.

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}





# Configure the AWS provider
provider "aws" {
  region = var.region
}





data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}




resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon_linux_2023.id
  instance_type = var.instance_type  


  # lifecycle {
  #   prevent_destroy = true
  # }

  



  tags = {
    Name = "Terraform-Lab-Instance"
  }
}