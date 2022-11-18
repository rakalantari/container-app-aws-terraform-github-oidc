module "elastic-container-service" {
  source = "./Modules/elastic-container-service"

  aws_region                        = var.aws_region
  environment_name                  = var.environment_name
  ecs_cluster_name                  = var.ecs_cluster_name
  container_name                    = var.container_name
  container_image                   = var.container_image
  host_port_http                    = var.host_port_http
  container_port_http               = var.container_port_http
  host_port_https                   = var.host_port_https
  container_port_https              = var.container_port_https
  ecs_task_definition_name          = var.ecs_task_definition_name
  ecs_task_network_mode             = var.ecs_task_network_mode
  ecs_task_requires_compatibilities = var.ecs_task_requires_compatibilities
  ecs_task_execution_role_arn       = module.iam-role.ecs_task_execution_role_arn
  ecs_task_cpu_units                = var.ecs_task_cpu_units
  ecs_task_memory_units             = var.ecs_task_memory_units
  ecs_service_name                  = var.ecs_service_name
  ecs_service_desired_task_count    = var.ecs_service_desired_task_count
  ecs_service_launch_type           = var.ecs_service_launch_type
  ecs_service_security_groups_ids   = [module.security-group.ecs_security_group_id]
  public_subnets_ids                = module.networking.public_subnets_ids
  target_group_arn                  = module.load-balancer.target_group_arn
  additional_tags                   = var.additional_tags

  depends_on = [module.load-balancer, module.iam-role, module.security-group]
}