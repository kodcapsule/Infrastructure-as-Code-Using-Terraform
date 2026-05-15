terraform {
  backend "s3" {
    bucket         = "s3-state-backend-terraform-staging-lab-101"
    key            = "workspace-example/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    use_lockfile = true
  }
}