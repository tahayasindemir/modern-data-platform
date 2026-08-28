provider "aws" {
  region = var.aws_region
}

provider "snowflake" {
  authenticator = "SNOWFLAKE_JWT"

  experimental_features_enabled = [
    "PROVIDER_CONFIGURATION_ACCOUNT_FALLBACK"
  ]

  preview_features_enabled = [
    "snowflake_table_resource"
  ]
}
