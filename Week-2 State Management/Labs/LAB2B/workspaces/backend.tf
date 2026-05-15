terraform {
  backend "s3" {
    bucket       = "s3-state-backend-terraform-workspace-lab-101"
    key          = "workspace-example/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true

  }
}