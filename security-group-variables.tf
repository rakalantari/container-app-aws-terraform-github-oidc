variable "load_balancer_security_group_name" {
  type        = string
  description = "name to be assigned to load balancer security group"
  default     = "load_balancer_security_group"
}

variable "load_balancer_security_group_description" {
  type        = string
  description = "description to be assigned to load balancer security group"
  default     = "security group for load balancer"
}

variable "ecs_service_security_group_name" {
  type        = string
  description = "name to be assigned to ecs service security group"
  default     = "ecs_service_security_group"
}

variable "ecs_service_security_group_description" {
  type        = string
  description = "description to be assigned to ecs service security group"
  default     = "security group for ecs instances within cluster"
}
