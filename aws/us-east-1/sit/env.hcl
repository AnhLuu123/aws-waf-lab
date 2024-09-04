locals {
  common     = read_terragrunt_config(find_in_parent_folders("common.hcl")).locals
  account    = read_terragrunt_config("account.hcl").locals
  aws_region = local.common.aws_region
  env_name   = "sit"
  prefix     = "${local.common.product_name}-${local.env_name}"
  #public_domain = ""

  ###############################
  # VPC Network
  ###############################
  vpc_cidr        = "10.51.0.0/20"
  azs             = ["${local.aws_region}a", "${local.aws_region}b", "${local.aws_region}c"]
  private_subnets = ["10.51.0.0/23", "10.51.2.0/23", "10.51.4.0/23"]
  public_subnets  = ["10.51.6.0/23", "10.51.8.0/23", "10.51.10.0/23"]
  # database_subnets = ["10.51.12.0/26", "10.51.12.64/26", "10.51.12.128/26"]
  ###############################
  # Tags
  ###############################
  tags = merge(local.common.tags, {
    Environment = "${local.env_name}"
  })
}