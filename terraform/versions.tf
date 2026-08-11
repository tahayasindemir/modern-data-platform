terraform {
  required_version = ">= 1.9.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }

    snowflake = {
      source  = "snowflakedb/snowflake"
      version = "~> 2.18"
    }
  }
}