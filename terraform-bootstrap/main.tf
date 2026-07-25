resource "aws_s3_bucket" "terraform_state" {
  bucket = "taha-modern-data-platform-tfstate"

  tags = {
    Project = "modern-data-platform"
    Managed = "Terraform"
  }
}

resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "terraform_lock" {
  name         = "terraform-locks"
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Project = "modern-data-platform"
    Managed = "Terraform"
  }
}