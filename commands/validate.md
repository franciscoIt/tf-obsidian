# validate

Runs checks that verify whether a configuration is syntactically valid and internally consistent,
regardless of any provided variables or existing state.
Primarily useful for general verification of reusable modules, including correctness of attribute names and value types.

```terraform
terraform validate          # validate configuration
terraform validate -json    # output result as machine-readable JSON
```
