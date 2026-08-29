data "aws_caller_identity" "current" {}

resource "aws_iam_role" "snowflake_s3" {
  name = "MDP_SNOWFLAKE_S3_ROLE"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          AWS = var.snowflake_storage_aws_iam_user_arn
        }

        Action = "sts:AssumeRole"

        Condition = {
          StringEquals = {
            "sts:ExternalId" = var.snowflake_storage_integration_external_id
          }
        }
      }
    ]
  })

  tags = local.common_tags
}

resource "aws_iam_policy" "snowflake_s3_read" {
  name        = "snowflake-s3-read"
  description = "Read-only access for Snowflake to the raw telemetry prefix."

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Action = [
          "s3:GetBucketLocation",
          "s3:ListBucket"
        ]

        Resource = aws_s3_bucket.data_lake.arn

        Condition = {
          StringLike = {
            "s3:prefix" = [
              "raw",
              "raw/*"
            ]
          }
        }
      },
      {
        Effect = "Allow"

        Action = [
          "s3:GetObject",
          "s3:GetObjectVersion"
        ]

        Resource = "${aws_s3_bucket.data_lake.arn}/raw/*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "snowflake_s3_read" {
  role       = aws_iam_role.snowflake_s3.name
  policy_arn = aws_iam_policy.snowflake_s3_read.arn
}
