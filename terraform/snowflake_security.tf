resource "snowflake_account_role" "terraform_admin" {
  name    = "MDP_TERRAFORM_ADMIN"
  comment = "Administrative role for Modern Data Platform Terraform resources"
}

resource "snowflake_user" "terraform" {
  name                           = "MDP_TERRAFORM"
  comment                        = "Terraform service user for the Modern Data Platform"
  rsa_public_key                 = var.snowflake_terraform_public_key
  default_role                   = snowflake_account_role.terraform_admin.name
  default_secondary_roles_option = "ALL"
  disabled                       = false
  must_change_password           = false
}

resource "snowflake_grant_account_role" "terraform_admin_to_user" {
  role_name = snowflake_account_role.terraform_admin.name
  user_name = snowflake_user.terraform.name
}