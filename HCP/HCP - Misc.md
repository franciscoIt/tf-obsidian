# Health Assessment

After infrastructure is deployed, Terraform Cloud periodically runs checks to detect:

- **Drift** — real infrastructure has changed outside of Terraform (e.g. someone manually modified a resource in the AWS console)
- **Failed checks** — `check` blocks defined in your configuration are evaluated against the current state
# Run triggers
 Automatically queue a run when another workspace completes a successful apply
 
 #### The Problem They Solve

In large infrastructures, workspaces are often split by layer:

```
networking workspace  →  database workspace  →  app workspace
```

Without run triggers, you'd have to manually run each workspace in order. Run triggers automate this chain.
# change requests
