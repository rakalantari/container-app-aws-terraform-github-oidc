variable "environment_name" {
  type        = string
  description = "name of environment this module belongs to"
}

variable "http_target_group_name" {
  type        = string
  description = "name of http target group"
}

variable "http_target_group_port" {
  type        = number
  description = "port used by target group"
}

variable "http_target_group_protocol" {
  type        = string
  description = "protocol used by target group"
}

variable "http_target_group_target_type" {
  type        = string
  description = "type of targets within target group"
}

variable "http_target_group_load_balancing_algorithm_type" {
  type        = string
  description = "type of algorithm used by http target group"
}

variable "load_balancer_name" {
  type        = string
  description = "name of load balancer"
}

variable "load_balancer_type" {
  type        = string
  description = "type of load balancer"
}

variable "load_balancer_internal" {
  type        = bool
  description = "boolean value indicating load balancer is internal"
}

variable "load_balancer_enable_deletion_protection" {
  type        = bool
  description = "boolean value indicating deletion protection must be enabled for load balancer"
}

variable "http_target_group_vpc_id" {
  type        = string
  description = "id of vpc that target group to be attached to"
}

variable "load_balancer_security_groups_ids" {
  type        = list(string)
  description = "ids of security groups to be applied to public application load balancer"
}

variable "load_balancer_public_subnets_ids" {
  type        = list(string)
  description = "ids of public subnets to be assigned to public application load balancer"
}

variable https_listener_port {
  type        = number
  description = "port used by https listener"
}

variable https_listener_protocol {
  type        = string
  description = "protocol used by https listener"
}

variable "https_listener_ssl_policy" {
  type        = string
  description = "ssl policy to be applied to public application load balancer"
}

variable "https_listener_ssl_certificate_arn" {
  type        = string
  description = "arn of ssl certificate to be applied to public application load balancer"
}

variable http_listener_port {
  type        = number
  description = "port used by http listener"
}

variable http_listener_protocol {
  type        = string
  description = "protocol used by http listener"
}

variable ssl_certificate_validation_sleep {
  description = "sleep time for certificate validation"
}

variable "additional_tags" {
  type        = map(string)
  description = "variable if additional tags are needed"
  default     = {}
}
