resource "aws_acm_certificate" "ssl_certificate" {
  domain_name               = var.hosted_zone.name
  subject_alternative_names = ["*.${var.hosted_zone.name}"]
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }

  tags = merge(
    { "Name" = "acm-certificate-${var.hosted_zone.name}" },
    var.additional_tags
  )
}

resource "aws_route53_record" "route53_record_cname" {
  for_each = {
    for dvo in aws_acm_certificate.ssl_certificate.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = var.hosted_zone.zone_id
}

resource "aws_acm_certificate_validation" "ssl_certificate_validation" {
  certificate_arn         = aws_acm_certificate.ssl_certificate.arn
  validation_record_fqdns = [for record in aws_route53_record.route53_record_cname : record.fqdn]
}

resource "time_sleep" "wait_10_seconds" {
  depends_on = [aws_acm_certificate_validation.ssl_certificate_validation]

  create_duration = "10s"
}
