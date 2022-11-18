variable "environment_name" {
  type        = string
  description = "name of environment this module belongs to"
}

variable vpc {
  description = "vpc to host infrastructure"
}

variable "public_subnets_ids" {
  type        = list(string)
  description = "ids of public subnets to apply the acl to"
}

variable "additional_tags" {
  type        = map(string)
  description = "variable if additional tags are needed"
  default     = {}
}