locals {
  name_prefix = format("%s-%s", var.project, var.environment)
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.5.0"

  name                                   = var.vpc_name != "" ? var.vpc_name : format("%s-vpc", local.name_prefix)
  manage_default_network_acl             = false
  cidr                                   = var.vpc_cidr
  azs                                    = var.azs
  private_subnets                        = var.private_subnet_cidrs
  public_subnets                         = var.public_subnet_cidrs
  database_subnets                       = var.database_subnet_cidrs
  enable_nat_gateway                     = var.enable_nat_gateway
  single_nat_gateway                     = var.single_nat_gateway
  one_nat_gateway_per_az                 = var.one_nat_gateway_per_az
  manage_default_route_table             = false
  manage_default_security_group          = false
  map_public_ip_on_launch                = true
  create_database_subnet_group           = var.create_database_subnet_group
  create_database_subnet_route_table     = var.create_database_subnet_route_table
  create_database_internet_gateway_route = var.create_database_internet_gateway_route
  create_database_nat_gateway_route      = var.create_database_nat_gateway_route
  enable_dns_hostnames                   = var.enable_dns_hostnames
  enable_dns_support                     = var.enable_dns_support
  enable_flow_log                        = var.enable_flow_log
  create_flow_log_cloudwatch_log_group   = var.create_flow_log_cloudwatch_log_group
  create_flow_log_cloudwatch_iam_role    = var.create_flow_log_cloudwatch_iam_role
  flow_log_max_aggregation_interval      = var.flow_log_max_aggregation_interval
  private_inbound_acl_rules         = var.private_inbound_acl_rules
  private_dedicated_network_acl     = var.private_dedicated_network_acl
  public_dedicated_network_acl      = var.public_dedicated_network_acl
  enable_dhcp_options               = var.enable_dhcp_options
  # enable_s3_endpoint                = var.enable_s3_endpoint

  # private_subnet_tags = {
  #   "kubernetes.io/cluster/${local.name_prefix}" = "shared"
  #   "kubernetes.io/role/internal-elb"            = "1"
  # }
  # public_subnet_tags = {
  #   "kubernetes.io/cluster/${local.name_prefix}" = "shared"
  #   "kubernetes.io/role/elb"                     = "1"
  # }
}

# resource "aws_route53_zone" "private" {
#   count = var.create_route53_private_zone ? 1 : 0
#   name  = var.route53_private_domain
#   vpc {
#     vpc_id = module.vpc.vpc_id
#   }
#   dynamic "vpc" {
#     for_each = var.route53_private_zone_associated_vpcs
#     content {
#       vpc_id = vpc.value.vpc_id
#       vpc_region = lookup(vpc.value, "vpc_region", null)
#     }
#   }
#   comment = "Private zone ${var.route53_private_domain}"
# }
