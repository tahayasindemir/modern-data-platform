provider "aws" {
  region = var.aws_region
}

provider "snowflake" {
  authenticator = "SNOWFLAKE_JWT"
}