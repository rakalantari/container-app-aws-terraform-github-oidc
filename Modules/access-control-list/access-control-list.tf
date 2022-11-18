resource "aws_network_acl" "network_acl_public_subnets" {
  vpc_id = var.vpc.id

  subnet_ids = var.public_subnets_ids

  tags = merge(
    { "Environment" = var.environment_name },
    { "Name" = format("network_acl-public-subnets-${var.environment_name}") },
    var.additional_tags
  )
}

resource "aws_network_acl_rule" "network_acl_rule_inbound_allow_22" {
  network_acl_id = aws_network_acl.network_acl_public_subnets.id
  rule_number    = 100
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 22
  to_port        = 22
}

resource "aws_network_acl_rule" "network_acl_rule_inbound_allow_80" {
  network_acl_id = aws_network_acl.network_acl_public_subnets.id
  rule_number    = 200
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 80
  to_port        = 80
}

resource "aws_network_acl_rule" "network_acl_rule_inbound_allow_443" {
  network_acl_id = aws_network_acl.network_acl_public_subnets.id
  rule_number    = 300
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 443
  to_port        = 443
}

resource "aws_network_acl_rule" "network_acl_rule_inbound_allow_ephemeral" {
  network_acl_id = aws_network_acl.network_acl_public_subnets.id
  rule_number    = 400
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 1024
  to_port        = 65535
}

resource "aws_network_acl_rule" "network_acl_rule_inbound_deny_all" {
  network_acl_id = aws_network_acl.network_acl_public_subnets.id
  rule_number    = 500
  egress         = false
  protocol       = "-1"
  rule_action    = "deny"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 65535
}

resource "aws_network_acl_rule" "network_acl_rule_outbound_allow_all" {
  network_acl_id = aws_network_acl.network_acl_public_subnets.id
  rule_number    = 100
  egress         = true
  protocol       = "-1"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 65535
}