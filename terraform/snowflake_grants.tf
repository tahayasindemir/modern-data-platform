resource "snowflake_grant_privileges_to_account_role" "raw_stage_usage" {
  account_role_name = snowflake_account_role.terraform_admin.name
  privileges        = ["USAGE"]

  on_schema_object {
    object_type = "STAGE"
    object_name = snowflake_stage_external_s3.raw.fully_qualified_name
  }
}
