# AWS Route53 Zone Terraform module

Terraform module which creates AWS Route53 Zone and updates SOA record.

By default SOA TTLs will be set to `180 60 1209600 60`. This behavior can be disabled by passing `null` for `soa_ttls` attribute
or by setting it to another value.

## Usage

### Public hosted zone

```hcl
module "route53_public_zone" {
  source  = "spirius/route53-zone/aws"
  version = "~> 1.0"

  name    = "example.com"
  comment = "My hosted zone."

  tags    = {
    Name = "example.com"
  }
}
```

### Private hosted zone (VPC)

```hcl
module "route53_private_zone" {
  source  = "spirius/route53-zone/aws"
  version = "~> 1.0"

  name    = "int.example.com"
  comment = "My internal hosted zone."

  vpc_id = "vpc-12345678"

  tags    = {
    Name = "example.com"
  }
}
```
