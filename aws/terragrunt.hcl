locals {
  env_vars            = read_terragrunt_config(find_in_parent_folders("env.hcl")).locals
  common_vars         = read_terragrunt_config(find_in_parent_folders("common.hcl")).locals
  aws_region          = local.common_vars.aws_region
  product_name        = local.common_vars.product_name
  common_account_id   = local.common_vars.account_id
  common_account_name = local.common_vars.account_name
  account_vars        = read_terragrunt_config(find_in_parent_folders("account.hcl")).locals
  aws_assume_role_arn = "arn:aws:iam::${local.account_vars.aws_account_id}:role/${local.account_vars.assume_role_name}"
  aws_profile         = local.account_vars.aws_profile

  state_account_id      = local.account_vars.state_account_id
  state_role_name       = local.account_vars.state_role_name
  state_assume_role_arn = "arn:aws:iam::${local.state_account_id}:role/${local.state_role_name}"
  state_bucket_name     = "${local.product_name}-${local.env_vars.env_name}-${local.aws_region}-tfstate"
}
generate "provider" {
  path           = "provider.tf"
  if_exists      = "overwrite_terragrunt"
  comment_prefix = "#"
  contents       = <<EOF
provider "aws" {
  region = "${local.aws_region}"
  profile        = "${local.aws_profile}"
  # assume_role {
  #   role_arn = "${local.aws_assume_role_arn}"
  # }
}
EOF
}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    bucket         = local.state_bucket_name
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = local.aws_region
    encrypt        = true
    dynamodb_table = "${local.product_name}-${local.env_vars.env_name}-${local.aws_region}-tfstate"
    profile        = "${local.aws_profile}"
    # role_arn = "${local.state_assume_role_arn}"
  }
}
