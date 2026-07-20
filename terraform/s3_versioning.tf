resource "aws_s3_bucket_versioning" "data_lake" {

  bucket = aws_s3_bucket.data_lake.id

  versioning_configuration {
    status = "Enabled"
  }

}