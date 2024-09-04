
include "terraform" {
  path = find_in_parent_folders()
}

locals {
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl")).locals
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl")).locals
}

terraform {
  source = "github.com/terraform-aws-modules/terraform-aws-vpc?ref=v5.5.0"
}

inputs = {
  name                          = "${local.env_vars.prefix}-us-vpc"
  cidr                          = local.env_vars.vpc_cidr
  azs                           = local.env_vars.azs
  private_subnets               = local.env_vars.private_subnets
  private_dedicated_network_acl = true
  private_inbound_acl_rules = [
    {
      "cidr_block" : "0.0.0.0/0",
      "from_port" : 0,
      "protocol" : "-1",
      "rule_action" : "allow",
      "rule_number" : 100,
      "to_port" : 0
    }
  ]
  public_subnets               = local.env_vars.public_subnets
  public_dedicated_network_acl = true
  enable_nat_gateway           = true
  single_nat_gateway           = true
  one_nat_gateway_per_az       = false

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_dhcp_options       = true
  enable_s3_endpoint        = false
  enable_public_s3_endpoint = false
  tags                      = local.env_vars.tags
}

