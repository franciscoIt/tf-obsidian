# Blocks

[[resource]]   ████████████████████  daily
[[variable]]   ██████████████        daily
[[output]]     ████████              frequent
[[data]]       ████████              frequent
[[locals]]     ██████                frequent
[[provider]]   ████                  per project
[[terraform]]  ████                  per project
[[module]]     ████                  when modularising
[[import]]     ██                    migration
[[moved]]      ██                    refactoring
[[removed]]    ██                    deprecation
[[check]]      █                     advanced validation

## HCL Syntax

![[hcl-syntax.png]]
## Quick Syntax Reference
```json
# Two labels
resource "aws_instance" "web" { ... }

# One label
provider "aws" { ... }
variable "region" { ... }
output "ip" { ... }
module "vpc" { ... }
data "aws_ami" "latest" { ... }

# No labels
terraform { ... }
locals { ... }

# State lifecycle (no labels)
import { to = ..., id = "..." }
moved { from = ..., to = ... }
removed { from = ..., lifecycle { destroy = false } }

# Validation (one label)
check "health" { ... }
```


