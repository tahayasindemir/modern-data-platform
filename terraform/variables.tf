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