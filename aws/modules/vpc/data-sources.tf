# eip create manual
data "aws_availability_zones" "available_azs" {
  state = "available"
}

#data "aws_subnet_ids" "available_subnet_ids" {
data "aws_subnets" "available_subnet_ids" {
  #  vpc_id     = module.vpc.vpc_id
  filter {
    name   = "vpc-id"
    values = [module.vpc.vpc_id]
  }
  depends_on = [module.vpc]
}
