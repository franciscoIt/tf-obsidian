# destroy

Destroys all resources managed by the current Terraform configuration.

```terraform
terraform destroy                               # interactive destroy (asks for confirmation)
terraform destroy -auto-approve                 # skip confirmation
terraform destroy -target=aws_instance.web      # destroy a specific resource
```
