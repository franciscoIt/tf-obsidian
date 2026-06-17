┌─────────────────────────────────────────────────────┐
│  1. Write import block with real resource ID         │
│  2. Write (or generate) matching resource config     │
│  3. Run: terraform plan                              │
│     → Terraform reads live infra, previews import   │
│  4. Run: terraform apply                             │
│     → State is updated, resource is now managed     │
│  5. Remove the import block (no longer needed)       │
└─────────────────────────────────────────────────────┘
# Config Generation (`-generate-config-out`)

The killer feature of the `import` block is **automatic config generation**. You don't have to write the resource block yourself:

bash

```bash
terraform plan -generate-config-out=generated.tf
```

![[import-block-requirements.png]]


1. Import block — bring existing RDS instance under management
```shell 
import {
  to = aws_db_instance.production
  id = "prod-postgres-db"   # The RDS identifier
}
resource "aws_db_instance" "production" {
  identifier        = "prod-postgres-db"
  engine            = "postgres"
  engine_version    = "15.3"
  instance_class    = "db.t3.medium"
  allocated_storage = 100
  db_name           = "appdb"
  username          = "admin"
  password          = var.db_password

  backup_retention_period = 7
  multi_az                = true
  skip_final_snapshot     = false

  tags = {
    Environment = "production"
    Team        = "platform"
  }
}

# terraform plan

# Output:
# Plan: 1 to import, 0 to add, 0 to change, 0 to destroy.
	
# 4. Apply the import
terraform apply

# 5. Remove the import block from your config
```


#### Dynamic ID with `for_each`

For importing multiple similar resources at once, you can use `for_each` on the `import` block (Terraform 1.7+):

```shell
locals {
  buckets = {
    logs    = "my-company-logs-bucket"
    backups = "my-company-backups-bucket"
    assets  = "my-company-assets-bucket"
  }
}

import {
  for_each = local.buckets
  to       = aws_s3_bucket.imported[each.key]
  id       = each.value
}

resource "aws_s3_bucket" "imported" {
  for_each = local.buckets
  bucket   = each.value
}
```
