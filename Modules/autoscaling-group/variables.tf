variable "environment_name" {
  type        = string
  description = "name of environment this module belongs to"
}

variable "ecs_cluster" {
  description = "ecs cluster for which autoscaling to be applied to"
}

variable "ecs_service" {
  description = "ecs service for which autoscaling policies to be applied to"
}

variable "autoscaling_target_min_capacity" {
  type        = number
  description = "min capacity for auto scaling target"
}

variable "autoscaling_target_max_capacity" {
  type        = number
  description = "max capacity for auto scaling target"
}

variable "autoscaling_target_scalable_dimension" {
  type        = string
  description = "scalable dimension for auto scaling target"
}

variable "autoscaling_target_service_namespace" {
  type        = string
  description = "service namespace for auto scaling target"
}

variable "autoscaling_policy_name_prefix" {
  type        = string
  description = "prefix to be used in naming of all autoscaling policies"
}

variable "autoscaling_policy_type_memory" {
  type        = string
  description = "type of policy to be used in memory autoscaling policy"
}

variable "autoscaling_policy_predefined_metric_type_memory" {
  type        = string
  description = "predefind metric type for memory autoscaling policy"
}

variable "autoscaling_policy_target_value_memory" {
  type        = string
  description = "target value for memory autoscaling policy"
}

variable "autoscaling_policy_type_cpu" {
  type        = string
  description = "type of policy to be used in cpu autoscaling policy"
}

variable "autoscaling_policy_predefined_metric_type_cpu" {
  type        = string
  description = "predefind metric type for cpu autoscaling policy"
}

variable "autoscaling_policy_target_value_cpu" {
  type        = string
  description = "target value for cpu autoscaling policy"
}

variable "additional_tags" {
  type        = map(string)
  description = "variable if additional tags are needed"
  default     = {}
}