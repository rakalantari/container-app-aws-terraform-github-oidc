variable "aws_region" {
  description = "AWS region"
  default     = "us-west-2"
}

variable "ecr_repository_name" {
  description = "name of elastic container repository"
  default     = "elastic-container-repository"
}

variable "ecr_image_tag_mutability" {
  description = "value for image tag mutability"
  default     = "MUTABLE"
}

variable "ecr_scan_on_push" {
  description = "boolean value indicating image to be scanned on push"
  default     = true
}

variable "ecr_encryption_type" {
  description = "type of encryption to be used by elastic container repository"
  default     = "AES256"
}

variable s3_bucket_terraform_state_stage {
  default     = "rakalantari-terraform-state-stage"
  description = "name for s3 bucket holding terraform state file for stage environment"
}

variable s3_bucket_sse_algorithm_stage {
  default     = "AES256"
  description = "server side algorithm to be used for encrypting objects inside stage s3 bucket"
}

variable s3_bucket_terraform_state_production {
  default     = "rakalantari-terraform-state-production"
  description = "name for s3 bucket holding terraform state file for production environment"
}

variable s3_bucket_sse_algorithm_production {
  default     = "AES256"
  description = "server side algorithm to be used for encrypting objects inside production s3 bucket"
}

variable "additional_tags" {
  type        = map(string)
  description = "variable if additional tags are needed"
  default = {
    Created-by  = "terraform"
    Application = "wep-application"
  }
}
