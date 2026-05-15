terraform {
  backend "s3" {
    bucket         = "s3-state-backend-terraform-env-dev-lab-101"
    key            = "file-layouts/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    use_lockfile = true
  }
}