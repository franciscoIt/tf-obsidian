# init

Gather dependencies for the current project.

Creates `.terraform.lock.hcl`.
Consider upgrading providers with: `terraform init --upgrade`

```terraform
terraform init                                  # basic init
terraform init -upgrade                         # upgrade providers to latest allowed version
terraform init -reconfigure                     # force re-init (ignore existing state)
terraform init -backend-config=backend.hcl      # pass backend config separately
```
