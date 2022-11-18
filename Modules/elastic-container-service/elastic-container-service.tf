resource "aws_ecs_cluster" "ecs_cluster" {
  name = format("${var.ecs_cluster_name}-${var.environment_name}")

  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  tags = merge(
    { "Environment" = var.environment_name },
    { "Name" = format("ecs-cluster-${var.environment_name}") },
    var.additional_tags
  )
}

resource "aws_ecs_cluster_capacity_providers" "ecs_cluster_capacity_providers" {
  cluster_name = aws_ecs_cluster.ecs_cluster.name

  capacity_providers = ["FARGATE"]
}

data "template_file" "container_definition" {
  template = file("${path.module}/templates/container-definition.json")

  vars = {
    aws_region           = var.aws_region
    container_name       = format("${var.container_name}-${var.environment_name}")
    container_image      = var.container_image
    host_port_http       = var.host_port_http
    container_port_http  = var.container_port_http
    host_port_https      = var.host_port_https
    container_port_https = var.container_port_https
  }
}

resource "aws_ecs_task_definition" "ecs_task_definition" {
  family                   = format("${var.ecs_task_definition_name}-${var.environment_name}")
  execution_role_arn       = var.ecs_task_execution_role_arn
  task_role_arn            = var.ecs_task_execution_role_arn
  network_mode             = var.ecs_task_network_mode
  requires_compatibilities = var.ecs_task_requires_compatibilities
  cpu                      = var.ecs_task_cpu_units
  memory                   = var.ecs_task_memory_units
  container_definitions    = data.template_file.container_definition.rendered

  tags = merge(
    { "Environment" = var.environment_name },
    { "Name" = format("ecs-task-definition-${var.environment_name}") },
    var.additional_tags
  )
}

resource "aws_ecs_service" "ecs_service" {
  name            = format("${var.ecs_service_name}-${var.environment_name}")
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.ecs_task_definition.arn
  desired_count   = var.ecs_service_desired_task_count
  launch_type     = var.ecs_service_launch_type

  lifecycle {
    ignore_changes = [desired_count]
  }

  network_configuration {
    security_groups  = var.ecs_service_security_groups_ids
    subnets          = var.public_subnets_ids
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = format("${var.container_name}-${var.environment_name}")
    container_port   = var.container_port_http
  }

  tags = merge(
    { "Environment" = var.environment_name },
    { "Name" = format("ecs-service-${var.environment_name}") },
    var.additional_tags
  )
}