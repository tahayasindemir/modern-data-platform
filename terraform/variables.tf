variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "eu-central-1"
}

variable "bucket_name" {
  description = "Name of the raw data lake S3 bucket."
  type        = string
  nullable    = false
}

variable "github_owner" {
  description = "GitHub user or organization name."
  type        = string
}

variable "github_repository" {
  description = "GitHub repository name."
  type        = string
}

variable "snowflake_storage_integration_principal" {
  description = "AWS principal ARN provided by Snowflake for the S3 storage integration."
  type        = string
  sensitive   = true
}

variable "snowflake_storage_integration_external_id" {
  description = "External ID provided by Snowflake for the S3 storage integration."
  type        = string
  sensitive   = true
}
