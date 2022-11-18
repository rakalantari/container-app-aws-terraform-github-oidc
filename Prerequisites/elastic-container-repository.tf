resource "aws_ecr_repository" "ecr_repository" {
  name                 = var.ecr_repository_name
  image_tag_mutability = var.ecr_image_tag_mutability

  image_scanning_configuration {
    scan_on_push = var.ecr_scan_on_push
  }

  encryption_configuration {
    encryption_type = var.ecr_encryption_type
  }

  tags = merge(
    { "Name" = format("ecr-repository-${var.ecr_repository_name}") },
    var.additional_tags
  )
}