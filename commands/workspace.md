`terraform workspace list`List all workspaces; active one is marked with `*``terraform workspace new <name>`Create and switch to a new workspace`terraform workspace select <name>`Switch to an existing workspace`terraform workspace show`Print the name of the current workspace`terraform workspace delete <name>`Delete a workspace (must not be active; state must be empty)

```powershell
teterraform workspace new dev
terraform workspace new staging
terraform workspace new prod
```

```json
variable "instance_count" {
  default = {
    dev     = 1
    staging = 2
    prod    = 5
  }
}

resource "aws_instance" "app" {
  count = var.instance_count[terraform.workspace]
}
```
