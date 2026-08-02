data "aws_iam_policy_document" "github_oidc_assume_role" {
  statement {
    sid    = "GitHubActionsAssumeRole"
    effect = "Allow"

    actions = [
      "sts:AssumeRoleWithWebIdentity"
    ]

    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.github.arn]
    }

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values = [
        "sts.amazonaws.com"
      ]
    }

    condition {
      test     = "StringLike"
      variable = "token.actions.githubusercontent.com:sub"

      values = [
        "repo:tahayasindemir@*/modern-data-platform@*:*"
      ]
    }
  }
}

resource "aws_iam_role" "github_actions" {
  name = "github-actions-ecr"

  assume_role_policy = data.aws_iam_policy_document.github_oidc_assume_role.json

  tags = local.common_tags
}