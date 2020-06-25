resource "aws_route53_zone" "this" {
  name              = var.name
  comment           = var.comment
  force_destroy     = var.force_destroy
  delegation_set_id = var.delegation_set_id
  tags              = var.tags

  dynamic "vpc" {
    for_each = var.vpc_id == null ? [] : [null]

    content {
      vpc_id     = var.vpc_id
      vpc_region = var.vpc_region
    }
  }
}

resource "aws_route53_record" "soa" {
  count = var.soa_ttls == null ? 0 : 1

  allow_overwrite = true
  name            = aws_route53_zone.this.name
  ttl             = var.soa_record_ttl
  type            = "SOA"
  zone_id         = aws_route53_zone.this.zone_id

  records = ["${trim(aws_route53_zone.this.name_servers[0], ".")}. awsdns-hostmaster.amazon.com. 1 ${var.soa_ttls}"]
}
