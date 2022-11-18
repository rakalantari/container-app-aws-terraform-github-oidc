variable "environment_name" {
  type        = string
  description = "name of environment this module belongs to"
}

variable "hosted_zone_name" {
  type        = string
  description = "name of hosted zone to be used for application"
}

variable "sub_domain" {
  type        = string
  description = "sub-domain for the hosted zone"
}

variable "load_balancer" {
  description = "load balancer to be attached to hosted zoned"
}

variable "additional_tags" {
  type        = map(string)
  description = "variable if additional tags are needed"
  default     = {}
}


