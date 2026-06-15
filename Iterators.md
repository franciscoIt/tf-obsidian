# Iterators

[[Relative references]]

| Scenario                          | Use                |
| --------------------------------- | ------------------ |
| Create N identical resources      | `count`            |
| Enable/disable a resource         | `count` (0 or 1)   |
| Resources with unique names/configs | `for_each`       |
| Avoiding index shift issues       | `for_each`         |
| Iterating over a map              | `for_each`         |

# count

`count` creates **multiple instances of a resource** using a simple number. It's the simpler alternative to `for_each`.

```json
resource "aws_instance" "example" {
  count = 3   # creates 3 instances

  ami           = "ami-12345678"
  instance_type = "t3.micro"

  tags = {
    Name = "server-${count.index}"  # 0, 1, 2
  }
}
```

With a conditional:

```json
resource "aws_eip" "nat" {
  count = var.environment == "prod" ? 1 : 0  # only in prod
}
```

# for_each

Creates one instance per item in a map or set. Each instance is keyed by the map key or set value — referenced as `resource["key"]`. Prefer this over `count` when instances have distinct identities, because adding/removing an item doesn't shift the indexes of others.

## Dynamic Block Iterator

|                | Regular `for_each`   | Dynamic block `for_each` |
| -------------- | -------------------- | ------------------------ |
| Iterator name  | `each`               | Block label (or custom via `iterator`) |
| Current key    | `each.key`           | `ingress.key`            |
| Current value  | `each.value`         | `ingress.value`          |
| Scope          | Whole resource       | Nested block only        |

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
