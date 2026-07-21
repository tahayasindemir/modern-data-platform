resource "aws_s3_bucket" "data_lake" {

  bucket = var.bucket_name

  tags = local.common_tags

}