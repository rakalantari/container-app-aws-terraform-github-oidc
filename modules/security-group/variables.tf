
variable "load_balancer_security_group_name" {
  type        = string
  description = "name to be assigned to load balancer security group"
}

variable "load_balancer_security_group_description" {
  type        = string
  description = "description to be assigned to load balancer security group"
}

variable "ecs_service_security_group_name" {
  type        = string
  description = "name to be assigned to ecs service security group"
}

variable "ecs_service_security_group_description" {
  type        = string
  description = "description to be assigned to ecs service security group"
}

variable "environment_name" {
  type        = string
  description = "name of environment this module belongs to"
}

variable "default_route_ip4" {
  type        = string
  description = "default route from and to internet"
  default     = "0.0.0.0/0"
}

variable "default_route_ip6" {
  type        = string
  description = "default route from and to internet"
  default     = "::/0"
}

variable "vpc_id" {
  type        = string
  description = "id of vpc that security groups apply to"
}

variable "additional_tags" {
  type        = map(string)
  description = "variable if additional tags are needed"
  default     = {}
}
