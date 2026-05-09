# terraform {
#   backend "s3" {
#     bucket         = "s3-state-backend-terraform-lab-101"
#     key            = "env/prod/terraform.tfstate"
#     region         = "us-east-1"
#     encrypt        = true
#     dynamodb_table = "terraform-lock-table"
#   }
# }