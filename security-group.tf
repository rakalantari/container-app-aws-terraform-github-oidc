module "security-group" {
  source = "./modules/security-group"

  environment_name                         = var.environment_name
  vpc_id                                   = module.networking.vpc_id
  load_balancer_security_group_name        = var.load_balancer_security_group_name
  load_balancer_security_group_description = var.load_balancer_security_group_description
  ecs_service_security_group_name          = var.ecs_service_security_group_name
  ecs_service_security_group_description   = var.ecs_service_security_group_description
  additional_tags                          = var.additional_tags
}