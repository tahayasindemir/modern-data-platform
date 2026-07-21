resource "aws_iam_policy" "data_lake_access" {

  name        = "data-lake-access"
  description = "Least privilege access to the Modern Data Platform S3 bucket."

  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {
        Effect = "Allow"

        Action = [
          "s3:ListBucket"
        ]

        Resource = aws_s3_bucket.data_lake.arn
      },

      {
        Effect = "Allow"

        Action = [
          "s3:GetObject",
          "s3:PutObject"
        ]

        Resource = "${aws_s3_bucket.data_lake.arn}/*"
      }

    ]

  })

}