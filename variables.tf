variable "name" {
  description = "The domain name of the hosted zone."
}

variable "comment" {
  description = "A comment for the hosted zone."
  default     = null
}

variable "force_destroy" {
  description = "Indicates if all records should be removed when destroying the zone."
  type        = bool
  default     = null
}

variable "delegation_set_id" {
  description = "The delegation set ID of route53 zone."
  default     = null
}

variable "vpc_id" {
  description = "ID of the VPC to associate the zone."
  default     = null
}

variable "vpc_region" {
  description = "Region of the associating VPC."
  default     = null
}

variable "tags" {
  description = "Tags"
  type        = map(string)
}

variable "soa_ttls" {
  description = "Value of SOA record (only TTLs): [refresh] [retry] [expire] [minimum]."
  default     = "180 60 1209600 60"
  type        = string
}

variable "soa_record_ttl" {
  description = "The TTL of the SOA record itself."
  default     = 900
  type        = number
}
