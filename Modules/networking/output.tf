
output "vpc_id" {
  value = aws_vpc.vpc.id
}

output vpc {
  value       = aws_vpc.vpc
}

data "aws_subnets" "public_subnets" {

  filter {
    name   = "vpc-id"
    values = [aws_vpc.vpc.id]
  }

  tags = {
    Type = var.public_subnet_interfix
  }
}

output "public_subnets_ids" {
  value = aws_subnet.public_subnets[*].id
}
