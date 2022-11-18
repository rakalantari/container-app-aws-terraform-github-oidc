data "aws_route53_zone" "hosted_zone" {
  name = var.hosted_zone_name
}

resource "aws_route53_record" "route53_record_a" {
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name    = format("${var.sub_domain}.${data.aws_route53_zone.hosted_zone.name}")
  type    = "A"

  alias {
    name                   = var.load_balancer.dns_name
    zone_id                = var.load_balancer.zone_id
    evaluate_target_health = true
  }
}