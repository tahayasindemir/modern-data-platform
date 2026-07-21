resource "aws_iam_user_policy_attachment" "data_platform" {

  user = aws_iam_user.data_platform.name

  policy_arn = aws_iam_policy.data_lake_access.arn

}