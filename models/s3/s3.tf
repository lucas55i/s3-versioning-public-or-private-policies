resource "aws_s3_bucket" "s3_versioning" {
  bucket = "bucket-versioning-lucas-terraform-20250713"
  region = "us-east-1"

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-s3"
    }
  )
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.s3_versioning.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "s3_versioning_active" {
  bucket = aws_s3_bucket.s3_versioning.id
  versioning_configuration {
    status = "Disabled"
  }
}