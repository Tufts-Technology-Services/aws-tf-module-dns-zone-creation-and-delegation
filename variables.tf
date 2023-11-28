variable "zone_name" {
  description = "The name to use for this new zone and subsequent delegation records"
  type        = string
}

variable "delegation_record_ttl" {
  description = "ttl for the record that delegates the subzone"
  type        = number
  default     = 300
}

variable "parent_zone_id"{
    description = "the identifier (not arn) of the parent route53 zone"
    type = string
}