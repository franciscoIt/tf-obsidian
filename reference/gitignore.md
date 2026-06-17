- **Never commit** `*.tfstate` — state files often contain secrets in plaintext. Use a remote backend (S3, GCS, Terraform Cloud) instead.
- **`.terraform.lock.hcl`** — this is intentionally commented out above. Most teams _do_ commit it to pin provider versions, like a `package-lock.json`.
- **`*.tfvars`** — be careful here. If your `.tfvars` files contain secrets, exclude them. But if they only hold non-sensitive variable values (like region names), you may want to commit them and exclude only `*.secret.tfvars` or similar.
- **Plan files (`*.tfplan`)** — can contain sensitive resource data, so best kept out of version control.

```json
# Local .terraform directories (downloaded providers & modules)
**/.terraform/*

# Terraform lock file — commit this if you want reproducible runs
# .terraform.lock.hcl

# State files — NEVER commit these (contain sensitive data)
*.tfstate
*.tfstate.*
*.tfstate.backup

# Crash log files
crash.log
crash.*.log

# Terraform variable files with sensitive values
*.tfvars
*.tfvars.json

# Override files (used for local dev overrides)
override.tf
override.tf.json
*_override.tf
*_override.tf.json

# CLI config override file
.terraformrc
terraform.rc

# Plan files (can contain sensitive data)
*.tfplan
*.plan

# Generated files
.terraform.tfstate

# macOS
.DS_Store

# Editor directories and files
.idea/
.vscode/
*.swp
*.swo
```