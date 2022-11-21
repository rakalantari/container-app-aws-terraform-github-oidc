output "ecs_cluster_name" {
  value = aws_ecs_cluster.ecs_cluster.name
}

output "ecs_cluster" {
  value = aws_ecs_cluster.ecs_cluster
}

output "ecs_service" {
  value = aws_ecs_service.ecs_service
}
