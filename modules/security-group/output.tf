output "public_security_group_id" {
  value = aws_security_group.public_security_group.id
}

output "ecs_security_group_id" {
  value = aws_security_group.ecs_service_security_group.id
}
