
#---- vpc variable
variable "waf_name" {
  type        = string
  description = "EKS cluster name."
}
variable "vpc_main_network_block" {
  type        = string
  description = "Base CIDR block to be used in our VPC."
}

# create_private_zone
variable "create_private_zone" {
  type        = bool
  description = "Create a private zone for the VPC."
  default     = true
}

variable "private_subnets" {
  type        = list(string)
  description = "List of private subnets."
}
variable "public_subnets" {
  type        = list(string)
  description = "List of public subnets."
}
variable "availability_zones" {
  type        = list(string)
  description = "List of availability zones."
}