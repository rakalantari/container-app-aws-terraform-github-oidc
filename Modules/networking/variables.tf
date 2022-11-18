
variable "environment_name" {
  type        = string
  description = "name of environment this module belongs to"
}

variable "vpc_cidr_block" {
  type        = string
  description = "cidr block for this vpc"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "boolean value indicating dns hostnames to be enabled"
}

variable "enable_dns_support" {
  type        = bool
  description = "boolean value indicating dns support to be enabled"
}

variable "availability_zones" {
  type        = list(string)
  description = "availability zones"
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

variable "public_subnets_cidr_blocks" {
  type        = list(string)
  description = "public subnets cidr blocks within vpc"
}

variable "public_subnet_interfix" {
  type        = string
  description = "interfix to public subnet name"
  default     = "public"
}

variable "private_subnets_cidr_blocks" {
  type        = list(string)
  description = "private subnets cidr blocks within vpc"
}

variable "private_subnet_interfix" {
  type        = string
  description = "interfix to private subnet name"
  default     = "private"
}

variable "additional_tags" {
  type        = map(string)
  description = "variable if additional tags are needed"
  default     = {}
}


