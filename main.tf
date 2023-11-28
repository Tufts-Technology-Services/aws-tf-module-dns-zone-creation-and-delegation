resource "aws_route53_zone" "route53_zone" {
  name = var.zone_name
}

resource "aws_route53_record" "route53_record" {
  zone_id = var.parent_zone_id
  name    = var.zone_name
  type    = "NS"
  ttl     = var.delegation_record_ttl
  records = aws_route53_zone.route53_zone.name_servers
}