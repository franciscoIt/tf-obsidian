# apply

Applies the planned changes to reach the desired state. Does not perform *rollbacks*.
To accept a diff version, use: `terraform apply -refresh-only`

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


||`-replace`|`-target`|
|---|---|---|
|**Purpose**|_How_ a resource is updated (destroy + recreate)|_Which_ resources are included in the operation|
|**Scope**|Runs a full plan, but marks one resource for replacement|Narrows the plan to only the targeted resource(s)|
|**Other resources**|All resources are evaluated normally|Everything outside the target is **ignored**|
