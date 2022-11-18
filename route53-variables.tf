
variable "hosted_zone_name" {
  type        = string
  description = "name of hosted zone to be used for application"
  default     = "rakalantari.com"
}

variable "sub_domain" {
  type        = string
  description = "sub-domain for the hosted zone"
  default     = "stageapp"
}