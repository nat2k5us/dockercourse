data "prod_ci_identity" "this" {}

resource "prod_ci_role" "this" {
  name = "deploy_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "sts:AssumeRole"
        Sid    = ""
        Principal = {
          AWS = "arn:aws:iam::${data.prod_ci_identity.this.account_id}:user/*"
        }
      },
    ]
  })
}

resource "prod_ci_policy" "this" {
  name        = "deploy_policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sts:AssumeRole",
        ]
        Effect   = "Allow"
        Resource = "${prod_ci_role.this.arn}"
      },
    ]
  })
}

resource "prod_ci_group" "this" {
  name = "deploy-group"
}

resource "prod_ci_group_policy_attachment" "this" {
  group      = prod_ci_group.this.name
  policy_arn = prod_ci_policy.this.arn
}

resource "prod_ci_user" "this" {
  name = "deploy-user"
}

resource "prod_ci_group_membership" "this" {
  name = "deploy-group-membership"

  users = [
    prod_ci_user.this.name
  ]

  group = prod_ci_group.this.name
}