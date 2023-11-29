resource "aws_route53_zone" "route53_zone" {
  name = var.zone_name
}

# This sets a NS record in the parent to delegate 
# to the zone we just created.
resource "aws_route53_record" "route53_record" {
  zone_id = var.parent_zone_id
  name    = var.zone_name
  type    = "NS"
  ttl     = var.delegation_record_ttl
  records = aws_route53_zone.route53_zone.name_servers
}

# This delegates the additional subzones off of the team zone.
# This needs to be done differently because these zones don't get created
# by this account/repo, they live in the workload accounts, and so all
# we'll have is a list of nameservers.
resource "aws_route53_record" "additional_records" {
  zone_id = aws_route53_zone.route53_zone.id
  
  for_each      = var.additional_delegation_records
  
  name    = each.value.host_name
  type    = "NS"
  ttl     = var.delegation_record_ttl
  records = each.value.ns
}