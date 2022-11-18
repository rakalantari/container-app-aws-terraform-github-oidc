terraform {
  backend "s3" {
    bucket         = "rakalantari-terraform-state-stage"
    key            = "terraform-state-file/stage.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
    #profile        = "terraform"
  }
}

provider "aws" {
  region = var.aws_region
  #shared_config_files      = ["~/.aws/config"]
  #shared_credentials_files = ["~/.aws/credentials"]
  #profile                  = "terraform"
}
