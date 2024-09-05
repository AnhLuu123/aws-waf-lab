
#region module vpc ====================================================
variable "vpc_main_network_block" {
  type        = string
  description = "Base CIDR block to be used in our VPC."
}
variable "waf_name" {
  type        = string
  description = "waf name."
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
variable "access_key" {
  type        = string
  description = "AWS access key."
}
variable "secret_key" {
  type        = string
  description = "AWS secret key."
}
variable "region" {
  type        = string
  description = "AWS region."
}
