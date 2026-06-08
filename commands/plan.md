# plan

Preview the changes Terraform will make before applying them. No resources are created or modified.

```terraform
terraform plan                                  # standard plan
terraform plan -out=tfplan                      # save plan to file (use with apply)
terraform plan -var="env=prod"                  # pass a variable inline
terraform plan -var-file=prod.tfvars            # pass a variables file
terraform plan -target=aws_instance.web         # plan only a specific resource
terraform plan -destroy                         # preview a destroy
```
