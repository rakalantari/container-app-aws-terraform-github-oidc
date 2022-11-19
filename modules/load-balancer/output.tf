output "target_group_arn" {
  value       = aws_lb_target_group.http_target_group.arn
  description = "arn of http target group"
}

output "load_balancer_dns_name" {
  value       = aws_lb.load_balancer.dns_name
  description = "dns name for load balancer"
}

output "load_balancer" {
  value       = aws_lb.load_balancer
  description = "load balancer"
}

