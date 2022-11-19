resource "aws_s3_bucket" "terraform_state_stage" {
  bucket = var.s3_bucket_terraform_state_stage

  lifecycle {
    prevent_destroy = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = var.s3_bucket_sse_algorithm_stage
      }
    }
  }

  tags = merge(
    { "Name" = var.s3_bucket_terraform_state_stage },
    { "Environment" = "stage" },
    var.additional_tags
  )
}

resource "aws_s3_bucket_acl" "bucket_acl_stage" {
  bucket = aws_s3_bucket.terraform_state_stage.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "bucket_versioning_stage" {
  bucket = aws_s3_bucket.terraform_state_stage.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket" "terraform_state_production" {
  bucket = var.s3_bucket_terraform_state_production

  lifecycle {
    prevent_destroy = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = var.s3_bucket_sse_algorithm_production
      }
    }
  }

  tags = merge(
    { "Name" = var.s3_bucket_terraform_state_production },
    { "Environment" = "production" },
    var.additional_tags
  )
}

resource "aws_s3_bucket_acl" "bucket_acl_production" {
  bucket = aws_s3_bucket.terraform_state_production.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "bucket_versioning_production" {
  bucket = aws_s3_bucket.terraform_state_production.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-state-locking"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
