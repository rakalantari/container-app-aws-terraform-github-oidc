output "ssl_certificate_arn" {
  value       = aws_acm_certificate.ssl_certificate.arn
  description = "arn of ssl certificate to be applied to application load balancer"
}

output "certificate_validation_sleep_time" {
  value       = time_sleep.wait_10_seconds
  description = "sleep time for certificate validation"
}
