# show / output

Inspect the current state, a saved plan, or declared outputs.

```terraform
terraform show                                  # show current state or a saved plan
terraform show tfplan                           # show a saved plan file
terraform show -json                            # output as JSON

terraform output                                # print all outputs
terraform output instance_ip                    # print a specific output value
terraform output -json                          # machine-readable JSON

# Generate a visual dependency graph (DOT format)
terraform graph | dot -Tsvg > graph.svg
```
