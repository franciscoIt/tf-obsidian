# Locals

Locals are best for **derived/computed values** you control; variables are for **external inputs** you want to expose.

## Use cases
1. Composing complex expressions once
```json
locals {
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}
```
2. Transforming variables
```json
locals {
  # Convert list to map for for_each
  users_map = { for u in var.users : u.name => u }
  
  # Conditional value
  instance_type = var.environment == "prod" ? "t3.large" : "t3.micro"
}
```
3. Flattening nested structures
```json
locals {
  all_rules = flatten([
    for sg in var.security_groups : sg.rules
  ])
}
```

| Rule                           | Detail                                                         |
| ------------------------------ | -------------------------------------------------------------- |
| **Reference syntax**           | Always `local.name` (singular), never `locals.name`            |
| **Block keyword**              | Declared in a `locals {}` block (plural)                       |
| **No input**                   | Locals can't accept arguments — they're constants within a run |
| **Can reference other locals** | `local.foo` can be used inside another local                   |
| **Multiple blocks allowed**    | You can have many `locals {}` blocks across files              |

### Locals vs Variables

||`locals`|`variables`|
|---|---|---|
|Set by|Config author|User / CI / `.tfvars`|
|Accepts input|No|Yes|
|Can use expressions|Yes (complex)|Limited (default only)|
|Reference|`local.name`|`var.name`| 
