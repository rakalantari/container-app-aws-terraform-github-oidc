resource "aws_security_group" "public_security_group" {
  name        = format("${var.load_balancer_security_group_name}-${var.environment_name}")
  description = var.load_balancer_security_group_description
  vpc_id      = var.vpc_id

  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [var.default_route_ip4]
    ipv6_cidr_blocks = [var.default_route_ip6]
  }

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [var.default_route_ip4]
    ipv6_cidr_blocks = [var.default_route_ip6]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.default_route_ip4]
    ipv6_cidr_blocks = [var.default_route_ip6]
  }

  tags = merge(
    { "Environment" = var.environment_name },
    { "Name" = format("public-security-group-${var.environment_name}") },
    var.additional_tags
  )
}

resource "aws_security_group" "ecs_service_security_group" {
  name        = format("${var.ecs_service_security_group_name}-${var.environment_name}")
  description = var.ecs_service_security_group_description
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP"
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    # Only allowing traffic in from the load balancer security group
    security_groups = [aws_security_group.public_security_group.id]
  }
  
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.default_route_ip4]
    ipv6_cidr_blocks = [var.default_route_ip6]
  }

  tags = merge(
    { "Environment" = var.environment_name },
    { "Name" = format("ecs-security-group-${var.environment_name}") },
    var.additional_tags
  )
}
