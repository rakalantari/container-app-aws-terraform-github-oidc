
variable "autoscaling_target_min_capacity" {
  type        = number
  description = "min capacity for auto scaling target"
  default     = 3
}

variable "autoscaling_target_max_capacity" {
  type        = number
  description = "max capacity for auto scaling target"
  default     = 5
}

variable "autoscaling_target_scalable_dimension" {
  type        = string
  description = "scalable dimension for auto scaling target"
  default     = "ecs:service:DesiredCount"
}

variable "autoscaling_target_service_namespace" {
  type        = string
  description = "service namespace for auto scaling target"
  default     = "ecs"
}

variable "autoscaling_policy_name_prefix" {
  type        = string
  description = "prefix to be used in naming of all autoscaling policies"
  default     = "autoscaling_policy"
}

variable "autoscaling_policy_type_memory" {
  type        = string
  description = "type of policy to be used in memory autoscaling policy"
  default     = "TargetTrackingScaling"
}

variable "autoscaling_policy_predefined_metric_type_memory" {
  type        = string
  description = "predefind metric type for memory autoscaling policy"
  default     = "ECSServiceAverageMemoryUtilization"
}

variable "autoscaling_policy_target_value_memory" {
  type        = string
  description = "target value for memory autoscaling policy"
  default     = 50
}

variable "autoscaling_policy_type_cpu" {
  type        = string
  description = "type of policy to be used in cpu autoscaling policy"
  default     = "TargetTrackingScaling"
}

variable "autoscaling_policy_predefined_metric_type_cpu" {
  type        = string
  description = "predefind metric type for cpu autoscaling policy"
  default     = "ECSServiceAverageCPUUtilization"
}

variable "autoscaling_policy_target_value_cpu" {
  type        = string
  description = "target value for cpu autoscaling policy"
  default     = 90
}