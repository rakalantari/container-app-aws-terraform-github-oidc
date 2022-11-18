variable "ecs_task_execution_role_name" {
  type        = string
  description = "name of ecs task execution role"
  default     = "WebAppECSTaskExecutionRole"
}

variable "iam_role_policy_arn" {
  type        = string
  description = "arn for the iam role policy"
  default     = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

variable "ecs_iam_instance_profile_name" {
  type        = string
  description = "name of iam instance profile"
  default     = "ecs-iam-instance-profile"
}