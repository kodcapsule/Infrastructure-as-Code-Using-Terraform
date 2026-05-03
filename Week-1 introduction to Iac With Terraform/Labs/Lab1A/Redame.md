# 🧪 LAB: Provision an EC2 Instance with Terraform


## 🎯 Objective
By the end of this lab, you will:
Configure a Terraform project
Use provider, variables, data sources, and resources
Launch an EC2 instance
Output the instance public IP

## 🧰 Prerequisites
AWS account
AWS CLI installed and configured (aws configure)
Terraform installed (terraform -v)
Basic understanding of Linux terminal

## Step-by-Step Guide

### Step 1: Create Project Structure

```bash
mkdir terraform-ec2-lab
cd terraform-ec2-lab
touch main.tf variables.tf outputs.tf
```

### Step 2: Configure Provider

In your main.tf file

```bash
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}
```
### 🧩 Step 3: Define Variables
```bash
variable "region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "t2.micro"
}
```

### Step 4: Fetch Latest Amazon Linux 2023 AMI

```bash
data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}
```

### Step 5: Create EC2 Instance

```bash
resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon_linux_2023.id
  instance_type = var.instance_type

  tags = {
    Name = "Terraform-Lab-Instance"
  }
}
```

###  Step 6: Define Outputs

```bash
output "instance_public_ip" {
  value = aws_instance.web.public_ip
}

output "instance_id" {
  value = aws_instance.web.id
}
```

### 🚀 Step 7: Initialize Terraform
```bash
terraform init
```

##  Step 8: Plan Deployment, Apply