variable "aws_region" {
  type        = string
  description = "aws region to be used for building stage infrastructure"
  default     = "us-west-2"
}

variable "environment_name" {
  type        = string
  description = "name of environment this module belongs to"
}

variable "additional_tags" {
  type        = map(string)
  description = "variable if additional tags are needed"
}