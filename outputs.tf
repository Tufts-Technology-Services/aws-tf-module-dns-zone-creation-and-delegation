output "zone_name" {
  value       = aws_route53_zone.route53_zone.name
  description = "the name of the route53 zone"
}

output "zone_id" {
  value       = aws_route53_zone.route53_zone.id
  description = "the ID of the route53 zone"
}

output "zone_arn" {
  value       = aws_route53_zone.route53_zone.arn
  description = "the arn of the route53 zone"
}

output "zone_ns" {
  value       = aws_route53_zone.route53_zone.name_servers
  description = "the name servers of the route53 zone"
}
