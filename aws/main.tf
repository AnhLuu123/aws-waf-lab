module "vpc" {
  source                 = "./modules/vpc"
  vpc_main_network_block = var.vpc_main_network_block
  waf_name               = var.waf_name
  private_subnets        = var.private_subnets
  public_subnets         = var.public_subnets
  availability_zones     = var.availability_zones
}
