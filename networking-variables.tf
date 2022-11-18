variable "vpc_cidr_block" {
  type        = string
  description = "cidr block for this vpc"
  default     = "10.123.0.0/16"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "boolean value indicating dns hostnames to be enabled"
  default     = true
}

variable "enable_dns_support" {
  type        = bool
  description = "boolean value indicating dns support to be enabled"
  default     = true
}

variable "availability_zones" {
  type        = list(string)
  description = "availability zones"
  default     = ["us-west-2a", "us-west-2b", "us-west-2c", "us-west-2d"]
}

variable "default_route_ip4" {
  type        = string
  description = "default route from and to internet"
  default     = "0.0.0.0/0"
}

variable "public_subnets_cidr_blocks" {
  type        = list(string)
  description = "public subnet cidr blocks within vpc"
  default     = ["10.123.0.0/24", "10.123.1.0/24", "10.123.2.0/24", "10.123.3.0/24"]
}

variable "private_subnets_cidr_blocks" {
  type        = list(string)
  description = "private subnets cidr blocks within vpc"
  default     = ["10.123.10.0/24", "10.123.11.0/24", "10.123.12.0/24", "10.123.13.0/24"]
}