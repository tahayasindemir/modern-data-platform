resource "aws_s3_bucket_lifecycle_configuration" "data_lake" {

  bucket = aws_s3_bucket.data_lake.id

  rule {

    id = "delete-old-versions"

    status = "Enabled"

    noncurrent_version_expiration {

      noncurrent_days = 30

    }

  }

}