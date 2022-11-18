resource "aws_lb_target_group" "http_target_group" {
  name                          = format("${var.http_target_group_name}-${var.environment_name}")
  port                          = var.http_target_group_port
  protocol                      = var.http_target_group_protocol
  target_type                   = var.http_target_group_target_type
  vpc_id                        = var.http_target_group_vpc_id
  load_balancing_algorithm_type = var.http_target_group_load_balancing_algorithm_type

  health_check {
    interval            = 10
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = merge(
    { "Environment" = var.environment_name },
    { "Name" = format("http-target-group-${var.environment_name}") },
    var.additional_tags
  )
}

resource "aws_lb" "load_balancer" {
  name               = format("${var.load_balancer_type}-${var.load_balancer_name}-${var.environment_name}")
  internal           = var.load_balancer_internal
  load_balancer_type = var.load_balancer_type
  security_groups    = var.load_balancer_security_groups_ids
  subnets            = var.load_balancer_public_subnets_ids

  enable_deletion_protection = var.load_balancer_enable_deletion_protection

  tags = merge(
    { "Environment" = var.environment_name },
    { "Name" = format("${var.load_balancer_type}-load-balancer-${var.environment_name}") },
    var.additional_tags
  )
}

resource "aws_lb_listener" "https_listener" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = var.https_listener_port
  protocol          = var.https_listener_protocol
  ssl_policy        = var.https_listener_ssl_policy
  certificate_arn   = var.https_listener_ssl_certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.http_target_group.arn
  }

  depends_on = [var.ssl_certificate_validation_sleep]

  tags = merge(
    { "Environment" = var.environment_name },
    { "Name" = format("https-listener-${var.environment_name}") },
    var.additional_tags
  )
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = var.http_listener_port
  protocol          = var.http_listener_protocol

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }

  tags = merge(
    { "Environment" = var.environment_name },
    { "Name" = format("http-listener-${var.environment_name}") },
    var.additional_tags
  )
}
