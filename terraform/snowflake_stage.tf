resource "snowflake_stage_external_s3" "raw" {
  name                = "TELEMETRY_RAW_STAGE"
  database            = snowflake_database.mdp.name
  schema              = snowflake_schema.raw.name
  url                 = "s3://${var.bucket_name}/raw/"
  storage_integration = snowflake_storage_integration_aws.s3_raw.name
  comment             = "External stage for raw truck telemetry in S3"
}
