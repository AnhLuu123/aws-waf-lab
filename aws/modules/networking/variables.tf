variable "environment" {
  type        = string
  description = "The name of the environment"
}

variable "project" {
  type        = string
  description = "Project name"
}

variable "vpc_name" {
  type    = string
  default = ""
}

variable "vpc_cidr" {
  type = string
}

variable "azs" {
  type = list(string)
}

variable "private_subnet_cidrs" {
  type = list(string)
}

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "database_subnet_cidrs" {
  type    = list(string)
  default = []
}

variable "enable_nat_gateway" {
  type    = bool
  default = true
}

variable "single_nat_gateway" {
  type    = bool
  default = true
}

variable "one_nat_gateway_per_az" {
  type    = bool
  default = false
}

variable "create_database_subnet_group" {
  type    = bool
  default = true
}

variable "create_database_subnet_route_table" {
  type    = bool
  default = true
}

variable "create_database_internet_gateway_route" {
  type    = bool
  default = false
}

variable "create_database_nat_gateway_route" {
  type    = bool
  default = true
}

variable "enable_dns_hostnames" {
  type    = bool
  default = true
}

variable "enable_dns_support" {
  type    = bool
  default = true
}
variable "enable_dhcp_options" {
  type    = bool
  default = true
}
variable "enable_flow_log" {
  type    = bool
  default = false
}

variable "create_flow_log_cloudwatch_log_group" {
  type    = bool
  default = false
}
variable "enable_s3_endpoint" {
  type    = bool
  default = false
}
variable "create_flow_log_cloudwatch_iam_role" {
  type    = bool
  default = false
}

variable "flow_log_max_aggregation_interval" {
  type    = number
  default = 60
}

variable "create_route53_private_zone" {
  type    = bool
  default = false
}

variable "route53_private_domain" {
  type    = string
  default = "carro.internal"
}
variable "private_dedicated_network_acl" {
  type    = bool
  default = false
}
variable "public_dedicated_network_acl" {
  type    = bool
  default = false
}

variable "route53_private_zone_associated_vpcs" {
  type = map(object({
    vpc_id     = string
    vpc_region = optional(string)
  }))
  default = {}
}
variable "private_inbound_acl_rules" {
  type = list(object({
    cidr_block  = string
    from_port   = number
    protocol    = string
    rule_action = string
    rule_number = number
    to_port     = number
  }))

}
