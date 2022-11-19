variable "environment_name" {
  type        = string
  description = "name of environment this module belongs to"
}

variable "ecs_task_execution_role_name" {
  type        = string
  description = "name of ecs task execution role"
}

variable "iam_role_policy_arn" {
  type        = string
  description = "arn for the iam role policy"
}

variable "ecs_iam_instance_profile_name" {
  type        = string
  description = "name of iam instance profile"
}


variable "additional_tags" {
  type        = map(string)
  description = "variable if additional tags are needed"
  default     = {}
}
