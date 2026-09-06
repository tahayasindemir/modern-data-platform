resource "snowflake_schema" "raw" {
  database = snowflake_database.mdp.name
  name     = "RAW"
  comment  = "Raw telemetry data ingested from Amazon S3"
}

resource "snowflake_schema" "staging" {
  database = snowflake_database.mdp.name
  name     = "STAGING"
  comment  = "Staging models managed by dbt"
}

resource "snowflake_schema" "intermediate" {
  database = snowflake_database.mdp.name
  name     = "INTERMEDIATE"
  comment  = "Intermediate transformations managed by dbt"
}