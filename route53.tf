module "route53" {
  source = "./modules/route53"

  environment_name = var.environment_name
  hosted_zone_name = var.hosted_zone_name
  sub_domain       = var.sub_domain
  load_balancer    = module.load-balancer.load_balancer
  additional_tags  = var.additional_tags
}