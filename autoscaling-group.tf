module "autoscaling" {
  source = "./Modules/autoscaling-group"

  environment_name                                 = var.environment_name
  ecs_cluster                                      = module.elastic-container-service.ecs_cluster
  ecs_service                                      = module.elastic-container-service.ecs_service
  autoscaling_target_min_capacity                  = var.autoscaling_target_min_capacity
  autoscaling_target_max_capacity                  = var.autoscaling_target_max_capacity
  autoscaling_target_scalable_dimension            = var.autoscaling_target_scalable_dimension
  autoscaling_target_service_namespace             = var.autoscaling_target_service_namespace
  autoscaling_policy_name_prefix                   = var.autoscaling_policy_name_prefix
  autoscaling_policy_type_memory                   = var.autoscaling_policy_type_memory
  autoscaling_policy_predefined_metric_type_memory = var.autoscaling_policy_predefined_metric_type_memory
  autoscaling_policy_target_value_memory           = var.autoscaling_policy_target_value_memory
  autoscaling_policy_type_cpu                      = var.autoscaling_policy_type_cpu
  autoscaling_policy_predefined_metric_type_cpu    = var.autoscaling_policy_predefined_metric_type_cpu
  autoscaling_policy_target_value_cpu              = var.autoscaling_policy_target_value_cpu
  additional_tags                                  = var.additional_tags

  depends_on = [module.elastic-container-service]
}
 