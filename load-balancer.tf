module "load-balancer" {
  source = "./modules/load-balancer"

  environment_name                                = var.environment_name
  http_target_group_name                          = var.http_target_group_name
  http_target_group_vpc_id                        = module.networking.vpc_id
  http_target_group_port                          = var.http_target_group_port
  http_target_group_protocol                      = var.http_target_group_protocol
  http_target_group_target_type                   = var.http_target_group_target_type
  http_target_group_load_balancing_algorithm_type = var.http_target_group_load_balancing_algorithm_type
  load_balancer_name                              = var.load_balancer_name
  load_balancer_type                              = var.load_balancer_type
  load_balancer_internal                          = var.load_balancer_internal
  load_balancer_enable_deletion_protection        = var.load_balancer_enable_deletion_protection
  load_balancer_security_groups_ids               = [module.security-group.public_security_group_id]
  load_balancer_public_subnets_ids                = module.networking.public_subnets_ids
  https_listener_port                             = var.https_listener_port
  https_listener_protocol                         = var.https_listener_protocol
  https_listener_ssl_policy                       = var.https_listener_ssl_policy
  https_listener_ssl_certificate_arn              = module.amazon-certificate-manager.ssl_certificate_arn
  http_listener_port                              = var.http_listener_port
  http_listener_protocol                          = var.http_listener_protocol
  ssl_certificate_validation_sleep                = module.amazon-certificate-manager.certificate_validation_sleep_time
  additional_tags                                 = var.additional_tags

  depends_on = [module.networking]
} 