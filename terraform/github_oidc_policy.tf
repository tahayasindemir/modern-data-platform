data "aws_iam_policy_document" "github_actions_ecr" {
  statement {
    sid    = "GetAuthorizationToken"
    effect = "Allow"

    actions = [
      "ecr:GetAuthorizationToken"
    ]

    resources = ["*"]
  }

  statement {
    sid    = "PushImage"
    effect = "Allow"

    actions = [
      "ecr:BatchCheckLayerAvailability",
      "ecr:CompleteLayerUpload",
      "ecr:InitiateLayerUpload",
      "ecr:UploadLayerPart",
      "ecr:PutImage",
      "ecr:BatchGetImage"
    ]

    resources = [
      aws_ecr_repository.telemetry_producer.arn
    ]
  }
}

resource "aws_iam_policy" "github_actions_ecr" {
  name        = "github-actions-ecr"
  description = "Permissions for GitHub Actions to push Docker images to Amazon ECR."

  policy = data.aws_iam_policy_document.github_actions_ecr.json

  tags = local.common_tags
}

resource "aws_iam_role_policy_attachment" "github_actions_ecr" {
  role       = aws_iam_role.github_actions.name
  policy_arn = aws_iam_policy.github_actions_ecr.arn
}