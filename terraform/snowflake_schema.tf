resource "snowflake_schema" "raw" {
  database = snowflake_database.mdp.name
  name     = "RAW"
  comment  = "Raw telemetry data ingested from Amazon S3"
}