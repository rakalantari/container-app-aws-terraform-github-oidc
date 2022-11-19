variable "environment_name" {
  type        = string
  description = "name of environment this module belongs to"
}

variable "hosted_zone" {
  description = "hosted zone to be used for application"
}

variable "additional_tags" {
  type        = map(string)
  description = "variable if additional tags are needed"
  default     = {}
}
