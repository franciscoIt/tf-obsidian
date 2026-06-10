# for_each

## Dynamic Block Iterator

| |Regular `for_each`|Dynamic block `for_each`|
|---|---|---|
|Iterator name|`each`|Block label (or custom via `iterator`)|
|Current key|`each.key`|`ingress.key`|
|Current value|`each.value`|`ingress.value`|
|Scope|Whole resource|Nested block only|

```json
locals {
  ingress_rules = {
    http  = { from_port = 80,  to_port = 80,  protocol = "tcp" }
    https = { from_port = 443, to_port = 443, protocol = "tcp" }
  }
}

dynamic "ingress" {
  for_each = local.ingress_rules

  content {
    from_port = ingress.value.from_port
    to_port   = ingress.value.to_port
    protocol  = ingress.value.protocol
    # ingress.key → "http", "https"
  }
}
```
