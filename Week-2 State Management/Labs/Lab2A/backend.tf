terraform {
  backend "s3" {
    bucket       = "s3-state-backend-terraform-lab-101"
    key          = "lab2a/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}