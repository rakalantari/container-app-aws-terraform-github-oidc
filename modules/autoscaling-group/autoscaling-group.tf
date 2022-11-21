
resource "aws_appautoscaling_target" "autoscaling_target" {
  min_capacity       = var.autoscaling_target_min_capacity
  max_capacity       = var.autoscaling_target_max_capacity
  resource_id        = "service/${var.ecs_cluster.name}/${var.ecs_service.name}"
  scalable_dimension = var.autoscaling_target_scalable_dimension
  service_namespace  = var.autoscaling_target_service_namespace
}

resource "aws_appautoscaling_policy" "autoscaling_policy_memory" {
  name               = format("${var.autoscaling_policy_name_prefix}-memory-${var.environment_name}")
  policy_type        = var.autoscaling_policy_type_memory
  resource_id        = aws_appautoscaling_target.autoscaling_target.resource_id
  scalable_dimension = aws_appautoscaling_target.autoscaling_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.autoscaling_target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = var.autoscaling_policy_predefined_metric_type_memory
    }

    target_value = var.autoscaling_policy_target_value_memory
  }
}

resource "aws_appautoscaling_policy" "autoscaling_policy_cpu" {
  name               = format("${var.autoscaling_policy_name_prefix}-cpu-${var.environment_name}")
  policy_type        = var.autoscaling_policy_type_cpu
  resource_id        = aws_appautoscaling_target.autoscaling_target.resource_id
  scalable_dimension = aws_appautoscaling_target.autoscaling_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.autoscaling_target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = var.autoscaling_policy_predefined_metric_type_cpu
    }

    target_value = var.autoscaling_policy_target_value_cpu
  }
}