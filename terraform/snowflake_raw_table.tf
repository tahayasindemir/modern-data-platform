resource "snowflake_table" "truck_telemetry_raw" {
  database = snowflake_database.mdp.name
  schema   = snowflake_schema.raw.name
  name     = "TRUCK_TELEMETRY"

  comment = "Raw telemetry JSON landing table loaded from the S3 external stage."

  column {
    name = "EVENT"
    type = "VARIANT"
  }

  column {
    name = "SOURCE_FILE"
    type = "VARCHAR"
  }

  column {
    name = "LOADED_AT"
    type = "TIMESTAMP_TZ"
  }
}
