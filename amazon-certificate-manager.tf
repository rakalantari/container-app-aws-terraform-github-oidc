module "amazon-certificate-manager" {
  source = "./modules/amazon-certificate-manager"

  environment_name = var.environment_name
  hosted_zone      = module.route53.hosted_zone
  additional_tags  = var.additional_tags

  depends_on = [module.route53]
}