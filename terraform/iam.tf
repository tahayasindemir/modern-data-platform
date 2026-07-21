resource "aws_iam_user" "data_platform" {
  name = "data-platform-user"

  tags = local.common_tags
}