resource "snowflake_storage_integration_aws" "s3_raw" {
  name    = "MDP_S3_RAW"
  enabled = true

  storage_provider = "S3"

  storage_aws_role_arn = aws_iam_role.snowflake_s3.arn

  storage_allowed_locations = [
    "s3://${var.bucket_name}/raw/"
  ]

  storage_aws_external_id = var.snowflake_storage_integration_external_id

  comment = "S3 storage integration for raw telemetry data"
}
