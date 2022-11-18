output "public_subnets_ids" {
  value       = module.networking.public_subnets_ids
  description = "ids of public subnets"
}

output "application_load_balancer_dns_name" {
  value       = format("http://${module.load-balancer.load_balancer_dns_name}")
  description = "dns name of application load balancer"
}

output "web_app_url" {
  value       = format("https://${var.sub_domain}.${module.route53.hosted_zone.name}")
  description = "secure url of web application"
}
