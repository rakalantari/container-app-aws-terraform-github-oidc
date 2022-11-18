variable "http_target_group_name" {
  type        = string
  description = "name of http target group"
  default     = "http-target-group"
}

variable "http_target_group_port" {
  type        = number
  description = "port used by target group"
  default     = 80
}

variable "http_target_group_protocol" {
  type        = string
  description = "protocol used by target group"
  default     = "HTTP"
}

variable "http_target_group_target_type" {
  type        = string
  description = "type of targets within target group"
  default     = "ip"
}

variable "http_target_group_load_balancing_algorithm_type" {
  type        = string
  description = "type of algorithm used by http target group"
  default     = "round_robin"
}

variable "load_balancer_name" {
  type        = string
  description = "name of load balancer"
  default     = "load-balancer"
}

variable "load_balancer_type" {
  type        = string
  description = "type of load balancer"
  default     = "application"
}

variable "load_balancer_internal" {
  type        = bool
  description = "boolean value indicating load balancer is internal"
  default     = false
}

variable "load_balancer_enable_deletion_protection" {
  type        = bool
  description = "boolean value indicating deletion protection must be enabled"
  default     = false
}

variable "https_listener_port" {
  type        = number
  description = "port used by https listener"
  default     = 443
}

variable "https_listener_protocol" {
  type        = string
  description = "protocol used by https listener"
  default     = "HTTPS"
}

variable "https_listener_ssl_policy" {
  type        = string
  description = "ssl policy to be applied to public application load balancer"
  default     = "ELBSecurityPolicy-2016-08"
}

variable "http_listener_port" {
  type        = number
  description = "port used by http listener"
  default     = 80
}

variable "http_listener_protocol" {
  type        = string
  description = "protocol used by http listener"
  default     = "HTTP"
}



