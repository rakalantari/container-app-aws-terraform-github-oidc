module "access-control-list" {
  source = "./modules/access-control-list"

  environment_name   = var.environment_name
  vpc                = module.networking.vpc
  public_subnets_ids = module.networking.public_subnets_ids
  additional_tags    = var.additional_tags
}