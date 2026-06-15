# Terraform Commands

## Subcommands

[[init]]
[[validate]]
[[plan]]
[[apply]]
[[destroy]]
[[commands/state]]
[[import]]
[[show output]]
[[workspace]]



## Useful commands

```json
# Plan and apply in one shot (non-interactive)
terraform plan -out=tfplan && terraform apply -auto-approve tfplan

# Full refresh and re-apply
terraform apply -refresh=true -auto-approve

# Nuke a specific module
terraform destroy -target=module.vpc -auto-approve

# Format check in CI
terraform fmt -check -recursive && terraform validate
```
