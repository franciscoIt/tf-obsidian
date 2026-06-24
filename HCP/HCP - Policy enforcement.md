![[www.udemy.com_course_hashicorp-certified-terraform-associate-004_learn_lecture_54701977.png]]
#### 1. Sentinel (Terraform Cloud / Enterprise)

Sentinel is HashiCorp's **policy-as-code framework**, deeply integrated into the Terraform Cloud workflow.

**How it works:**

The execution order is: Plan → **Sentinel Evaluation** → Apply

Sentinel policies can inspect the plan output and either pass, warn, or hard-fail the run.

```json
# Example: Enforce all S3 buckets have versioning enabled
import "tfplan/v2" as tfplan

s3_buckets = filter tfplan.resource_changes as _, rc {
  rc.type is "aws_s3_bucket" and
  rc.mode is "managed"
}

main = rule {
  all s3_buckets as _, bucket {
    bucket.change.after.versioning_configuration[0].status is "Enabled"
  }
}
```

**Enforcement levels:**
### entinel Enforcement Levels

| Level            | Blocks Apply? | Override?                       | Use Case                     |
| ---------------- | ------------- | ------------------------------- | ---------------------------- |
| `advisory`       | No            | —                               | Warnings / informational     |
| `soft-mandatory` | Yes           | ✅ Authorized users can override | Policies with exceptions     |
| `hard-mandatory` | Yes           | ❌ No override possible          | Strict compliance / security |

---

#### 2. OPA / Conftest (Open Source alternative)

For open-source Terraform, **Open Policy Agent (OPA)** with Conftest is common.

bash

```bash
# Run policy check against a plan
terraform show -json tfplan.binary > tfplan.json
conftest test tfplan.json --policy ./policies/
```

rego

```rego
# policies/deny_public_s3.rego
package main

deny[msg] {
  resource := input.resource_changes[_]
  resource.type == "aws_s3_bucket"
  resource.change.after.acl == "public-read"
  msg := sprintf("S3 bucket %v must not be public", [resource.address])
}
```
types
- Advisory 
- Mandatory 

![[www.udemy.com_course_hashicorp-certified-terraform-associate-004_learn_lecture_54701977 (2).png]]
