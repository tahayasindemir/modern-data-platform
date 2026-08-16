resource "snowflake_account_role" "terraform_admin" {
  name    = "MDP_TERRAFORM_ADMIN"
  comment = "Administrative role for Modern Data Platform Terraform resources"
}

resource "snowflake_grant_account_role" "terraform_admin_to_user" {
  role_name = snowflake_account_role.terraform_admin.name
  user_name = "MDP_TERRAFORM"
}