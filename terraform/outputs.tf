output "bucket_name" {
  value = aws_s3_bucket.data_lake.bucket
}

output "bucket_arn" {
  value = aws_s3_bucket.data_lake.arn
}

output "bucket_region" {
  value = aws_s3_bucket.data_lake.region
}

output "bucket_domain_name" {
  value = aws_s3_bucket.data_lake.bucket_domain_name
}