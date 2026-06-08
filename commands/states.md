# state

Inspect and manipulate the Terraform state file directly.

```terraform
terraform state list                                        # list all resources in state
terraform state show aws_instance.web                       # show details of one resource
terraform state mv aws_instance.old aws_instance.new        # rename/move a resource
terraform state rm aws_instance.web                         # remove resource from state (does not destroy it)
terraform state pull                                        # print current state as JSON
terraform state push terraform.tfstate                      # overwrite remote state
```
