








# =================== S3  backend configuration ===================

resource "aws_s3_bucket" "s3-backend" {

  bucket = "s3-state-backend-terraform-modules-lab3a"
  # lifecycle {
  #   prevent_destroy = true
  # }

}


resource "aws_s3_bucket_versioning" "s3-bucket_ver" {
  bucket = aws_s3_bucket.s3-backend.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "name" {
  bucket = aws_s3_bucket.s3-backend.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }


}


resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.s3-backend.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
# ===============================================================

module "compute" {
  source        = "./modules/compute"  
  # instance_type = var.instance_type
}


