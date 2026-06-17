![[meta-arguments-overview.png|411]]
# depends-on 
Forces an explicit dependency when Terraform can't infer it automatically. Normally Terraform builds a dependency graph from resource references — use depends_on only when a dependency exists but isn't expressed through a reference (e.g. an IAM policy that must exist before an EC2 instance can assume a role).
- Really slow services to be provisioned
- To avoid errors from race conditions.

# Count
Creates N copies of a resource, referenced by index: `resource[0]`, `resource[1]`, etc. Use when instances are identical or differ only by index.


# for_each
Creates one instance per item in a map or set. Each instance is keyed by the map key or set value — referenced as `resource["key"]`. Prefer this over `count` when instances have distinct identities, because adding/removing an item doesn't shift the indexes of others.
```shell
resource "aws_s3_bucket" "env_buckets" {
  for_each = toset(["dev", "staging", "prod"])

  bucket = "myapp-${each.key}"
}
```

# lifecycle
Controls how Terraform handles the create/update/destroy cycle for a resource. It has four sub-arguments. decreases downtime.
## create_before_destroy
Spin up the replacement before destroying the old one (avoids downtime):
```json
lifecycle {
  create_before_destroy = true
}
```

## prevent_destroy 
block `terraform destroy` from removing this resource (good for databases):
```json
lifecycle { prevent_destroy = true }
```

## ignore_changes 
stop Terraform from reverting changes made outside of Terraform (e.g. auto-scaling tweaks to instance count):
```json
lifecycle {
  ignore_changes = [tags, instance_type]
}
```

## replace_triggered_by 
Force replacement when another resource or attribute changes:
```json
lifecycle {
  replace_triggered_by = [aws_launch_template.app.id]
}
```
![[lifecycle-replace-triggered-by.png]]

## Preconditions - postconditions
Both blocks can be used together, and multiple `precondition`/`postcondition` blocks are allowed in the same `lifecycle`:
```json
lifecycle {
  precondition {
    condition     = var.environment != "prod" || var.instance_type != "t3.micro"
    error_message = "Use at least t3.small in production."
  }

  postcondition {
    condition     = self.tags["Environment"] != ""
    error_message = "Resource must have an Environment tag."
  }
}
```