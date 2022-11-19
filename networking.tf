module "networking" {
  source = "./modules/networking"

  environment_name            = var.environment_name
  vpc_cidr_block              = var.vpc_cidr_block
  enable_dns_hostnames        = var.enable_dns_hostnames
  enable_dns_support          = var.enable_dns_support
  public_subnets_cidr_blocks  = var.public_subnets_cidr_blocks
  private_subnets_cidr_blocks = var.private_subnets_cidr_blocks
  availability_zones          = var.availability_zones
  additional_tags             = var.additional_tags
}