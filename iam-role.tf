module "iam-role" {
  source = "./modules/iam-role"

  environment_name              = var.environment_name
  ecs_task_execution_role_name  = var.ecs_task_execution_role_name
  iam_role_policy_arn           = var.iam_role_policy_arn
  ecs_iam_instance_profile_name = var.ecs_iam_instance_profile_name
  additional_tags               = var.additional_tags
}