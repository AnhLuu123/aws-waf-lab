output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "The VPC ID."
}
output "private_subnets" {
  value       = module.vpc.private_subnets
  description = "List Private Subnet."
}
output "public_subnets" {
  value       = module.vpc.public_subnets
  description = "List Public Subnet."
}
output "aws_availability_zones_names" {
  value       = data.aws_availability_zones.available_azs.names
  description = "List available zone."
}
# security_group_id
# output "security_group_id" {
#   value       = module.vpc.security_group_ids
#   description = "The Security Group ID."
# }