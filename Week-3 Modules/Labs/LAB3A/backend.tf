terraform {
  backend "s3" {
    bucket       = "s3-state-backend-terraform-modules-lab3a"
    key          = "env/prod/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
    encrypt      = true

  }
}