# apply

Applies the planned changes to reach the desired state. Does not perform *rollbacks*.

If errors occur:
1. Already-created resources remain.
2. State file is updated.
3. Fixes must be applied, then re-run.

```terraform
terraform apply                                 # interactive apply (asks for confirmation)
terraform apply -auto-approve                   # skip confirmation prompt
terraform apply tfplan                          # apply a saved plan file
terraform apply -var="env=prod"                 # pass a variable inline
terraform apply -target=aws_instance.web        # apply only a specific resource
```
