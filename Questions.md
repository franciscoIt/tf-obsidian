### 1.
True or False? The immutable infrastructure pattern, where servers are replaced rather than modified in place, eliminates configuration drift because resources are never changed after initial provisioning.

**Response:**

---

### 2.
Your cluster team provides a list of Kubernetes namespaces to create. You define the variable as `type = list(string)` and want to use `for_each` to create one `kubernetes_namespace` per entry. Which configuration correctly handles the type conversion required by `for_each`?

**Response:**

The correct choice uses the `toset` function to convert the list of strings into a `set`, which is required by the `for_each` argument. This configuration correctly handles the type conversion for the `for_each` loop to create one `kubernetes_namespace` per entry in the list of namespaces. Alternatively, you could have used `tomap` as well to convert it to a `map`.

---

### 3.
You create a local module in the directory `./modules/webserver` and call it with:

```hcl
module "app" {
  source = "./modules/webserver"

  instance_type = "t2.micro"
}
```

The module's `variables.tf` file contains:

```hcl
variable "instance_type" {
  type = string
}

variable "ami_id" {
  type = string
}
```

What will happen when you run `terraform plan`?

**Response:**

```
│ Error: No value for required variable
│
│   on modules/webserver/variables.tf line 5, in variable "ami_id":
│    5: variable "ami_id" {
│
│ The root module input variable "ami_id" is not set, and has no default value.
│ Use a -var or -var-file command line argument to provide a value for this variable.
```

---

### 4.
Your colleague is debugging a suspected issue with Terraform's state locking mechanism and asks which logging configuration to use. What do you recommend to capture only the required logs?

**Response:**

Setting the `TF_LOG_CORE` environment variable to `TRACE` will focus specifically on Terraform's internal core logs, which are essential for debugging issues related to Terraform's state locking mechanism. This configuration will provide detailed information about Terraform's core operations and help identify any potential issues with the state locking mechanism.

---

### 5.
Your team manages a large infrastructure with 50+ resources in Terraform. You need to destroy a single EC2 instance for testing purposes without affecting any other infrastructure. Which command accomplishes this goal?

**Response:**

Using the `terraform destroy` command with the `-target` flag allows you to specify the specific resource (in this case, `aws_instance.test_server`) that you want to destroy without affecting any other resources in the Terraform configuration. This ensures that only the specified EC2 instance is destroyed for testing purposes.

---

### 6.
A Kubernetes deployment managed by Terraform needs to be recreated because a critical security patch requires a fresh container image pull, but no configuration attributes have changed. You want to force replacement of only that deployment without affecting other resources. Which command accomplishes this?

**Response:**

The `-replace` flag on `terraform apply` tells Terraform to force the destruction and recreation of a specific resource, even when no configuration changes would normally trigger replacement. The `-target` flag limits the scope of an operation but does not force replacement. Using a separate `destroy` and `apply` introduces unnecessary risk and downtime compared to the single atomic `-replace` operation.

---

### 7.
You want HCP Terraform to automatically detect when someone manually modifies a resource outside of Terraform. Which feature should you enable?

**Response:**

HCP Terraform **health assessments** automatically monitor your managed infrastructure and detect when real-world resources no longer match your Terraform configuration. Once enabled, health assessments run approximately every 24 hours and include two types of evaluations: drift detection, which compares actual infrastructure against the state file, and continuous validation, which checks whether custom conditions like check blocks, preconditions, and postconditions still pass. Health assessments are available in HCP Terraform Standard and Premium editions and can be enabled per-workspace or enforced organization-wide. If drift is detected, the workspace displays a "Health warning" status and can notify your team.

---

### 8.
Your team member manually modified several AWS security group rules directly in the AWS console instead of updating Terraform configuration. Before making new infrastructure changes, you want to update your state file to reflect these manual changes without modifying any infrastructure. Which command should you use?

**Response:**

The `terraform apply -refresh-only` command queries your cloud provider APIs to get the current state of all resources, compares them to your state file, updates the state to match reality, and critically does not make any changes to actual infrastructure. This is the current recommended approach for updating state to reflect manual changes or drift. It shows you what has changed in state and requires confirmation before updating, giving you visibility into what manual changes were made.

---

### 9. checkit
You are writing a backend configuration block for an S3 remote state. A colleague suggests using `var.bucket_name` inside the `backend` block to make it dynamic. Will this work for your configuration?

**Response:**

Backend configuration is processed during `terraform init`, which occurs before Terraform evaluates variables, locals, data sources, or any other expressions. Because of this, the `backend` block only accepts literal string values such as `bucket = "my-state-bucket"`. If you need dynamic backend configuration, you must use partial configuration with `-backend-config` flags or separate configuration files that are generated outside of Terraform before initialization runs.

---

### 10. checkit
You need to replace an EC2 instance whenever its associated security group changes, but you want to ensure the new instance is fully running before the old one is destroyed. Which `lifecycle` configuration accomplishes this? (select two)

**Response:**

- `replace_triggered_by = [aws_security_group.example]` — By specifying this, you are indicating that the replacement of the EC2 instance should be triggered by changes in the specified security group. This ensures that the instance is replaced whenever its associated security group changes.
- `create_before_destroy = true`

---

### 11.
Which of the following actions does `terraform init` perform? (select three)

**Response:**

- Configures the backend for storing Terraform state based on your backend configuration.
  - `terraform init` configures the backend for storing Terraform state. This step is crucial for defining where the state file will be stored, whether in a local file system, remote storage, or a version control system.
- Creates or updates the `.terraform.lock.hcl` file to record provider versions being used.
  - `terraform init` creates or updates the `.terraform.lock.hcl` file to record the versions of the providers being used. This file helps maintain consistency in provider versions across environments and ensures the same versions are used in subsequent runs.
- Downloads and installs provider plugins specified in your configuration into the `.terraform` directory.

---

### 12.
Two engineers on your team run `terraform apply` at the same time against the same workspace that uses an S3 backend with state locking. What are the correct outcomes? (select two)

> **Reference:** [State: Locking | Terraform | HashiCorp Developer](https://developer.hashicorp.com/terraform/language/v1.12.x/state/locking)

**Response:**

- The first `terraform apply` acquires the state lock, and the second engineer receives an error that the state is locked.
- If the backend does not support locking, simultaneous writes to the state file can lead to corruption. This is why it is crucial to use a backend with state locking capabilities to prevent data corruption and ensure that changes are applied correctly.

---

### 13.
You're refactoring a large Terraform project. Select all the true statements about using the `moved` block. (select three)

**Response:**

- You can use `moved` blocks to rename modules.
- The `moved` block should be deleted after successfully applying the changes.
  - After successfully applying the changes, it is recommended to delete the `moved` block. This helps maintain a clean Terraform configuration without unnecessary blocks that are no longer needed.
- You must write the new resource block before adding the `moved` block.
  - When using the `moved` block, it is essential to first write the new resource block before adding the `moved` block. This ensures that the new resource is properly defined and configured before moving any existing resources.

---

### 14.
What is the correct syntax for sourcing a module from the Terraform Registry?

**Response:**

```hcl
module "vpc" {
  source = "hashicorp/vpc/aws"
  # ... other arguments
}
```

The correct syntax is `source = "NAMESPACE/NAME/PROVIDER"`. For the official HashiCorp VPC module for AWS, this would be `source = "hashicorp/vpc/aws"`. Terraform automatically knows to look in the public Terraform Registry when you use this three-part naming convention. You don't need to include the full registry URL (`registry.terraform.io`) — that's implied by the shorthand syntax. The namespace comes first (the organization or user who published the module), then the module name, then the provider.

---

### 15. checkit
Your platform team has built several reusable Terraform modules. You want to share them with your organization while keeping the source code private. Which HCP Terraform feature should you use so the modules are easily discoverable and consumable right from the HCP Terraform UI?

**Response:**

**HCP Terraform's private registry** allows organizations to publish, version, and share Terraform modules and providers internally without making them publicly available. Modules are published from your connected VCS repositories, and the registry handles versioning automatically through Git tags. Consumers reference private modules using the source format `app.terraform.io/<ORGANIZATION>/<MODULE_NAME>/<PROVIDER>`, which mirrors the public registry format but with the `app.terraform.io` hostname prefix. The private registry also supports curating public modules, giving organizations a single place to manage both private and approved public components. The registry handles authentication and access through HCP Terraform API tokens, so module consumers don't need direct access to the source repository.

---

### 16. checkit
Your team is using Terraform to provision infrastructure across multiple cloud providers. Security has mandated that credentials must not be stored locally, should automatically expire, and must never appear in state files. Which approach meets all these requirements?

**Response:**

**HashiCorp Vault** with secrets engines (AWS, Azure, GCP, etc.) generates dynamic, short-lived credentials that automatically expire, eliminating local credential storage. Combined with `ephemeral` resources (Terraform 1.10+), the credentials are never written to state.

---

### 17.
Your **networking workspace** deploys subnets that your **firewall workspace** depends on. When new subnets are added, the firewall workspace needs to automatically update its rules. What should you configure?

**Response:**

Run **triggers** let you connect a downstream workspace to one or more source workspaces so that a successful apply in the source automatically queues a run in the downstream workspace. The key detail is that run triggers are configured in the downstream workspace — the one that needs to react to changes. In this scenario, the firewall workspace is downstream and depends on the networking workspace, so you configure the run trigger in the firewall workspace and specify the networking workspace as the source. When the networking workspace successfully applies new subnets, HCP Terraform automatically queues a run in the firewall workspace to pick up the changes. Each workspace can connect to up to 20 source workspaces.

---

### 18. checkit
What type of workflows are available when using HCP Terraform to manage Terraform runs? (select three)

> **Reference:** [UI and VCS-driven run workflow in HCP Terraform | Terraform | HashiCorp Developer](https://developer.hashicorp.com/terraform/cloud-docs/workspaces/run/ui)

**Response:**

- VCS-driven workflow
- API-driven workflow
- CLI-driven workflow

HCP Terraform supports three distinct workflows for managing Terraform runs. The VCS-driven workflow connects HCP Terraform to a version control system like GitHub or Bitbucket and automatically triggers runs when changes are merged. The CLI-driven workflow uses the local Terraform CLI to execute runs remotely on HCP Terraform, which integrates well with existing developer habits and CI/CD pipelines. The API-driven workflow provides the most flexibility by allowing an external orchestrator to trigger runs programmatically through HCP Terraform's API. Each workflow determines when and how Terraform runs occur, and the choice depends on your team's existing processes and automation requirements.

---

### 19.
When should you use the `depends_on` meta-argument instead of relying on Terraform's implicit dependency detection? (select two)

> **Reference:** [depends_on meta-argument reference | Terraform | HashiCorp Developer](https://developer.hashicorp.com/terraform/language/meta-arguments/depends_on)

**Response:**

- When resource B requires resource A to be fully operational, but doesn't reference it.
  - Using `depends_on` is necessary when resource B relies on resource A to be fully operational, even though there is no direct reference in the configuration. This ensures that Terraform understands the dependency relationship and manages creation and destruction accordingly.
- When dependencies exist outside of Terraform's resource graph.
  - `depends_on` should be used when there are dependencies that exist outside of Terraform's resource graph. This could include external systems or resources that need to be fully operational before Terraform can proceed.

**Overall:**

Terraform automatically detects dependencies when one resource references another's attributes (implicit dependencies), but some dependencies exist outside this detection mechanism. The `depends_on` meta-argument handles two specific scenarios. First, when a resource must be fully operational before another resource starts, but there's no attribute reference between them — for example, an application server that needs a database fully initialized, even though it doesn't reference database attributes in its configuration. Second, when dependencies exist outside Terraform's resource graph entirely, such as external services, manual processes, or runtime behaviors that Terraform can't detect. However, overusing `depends_on` can reduce Terraform's ability to parallelize operations and may slow execution, so it should only be used when implicit dependencies are insufficient.

---

### 20.
Your project uses version `5.60.0` of the `hashicorp/aws` provider, locked in the `.terraform.lock.hcl` file. A new version `5.65.0` has been released that includes a bug fix you need. Your version constraint is `~> 5.0`. What must you run to upgrade?

**Response:**

Run `terraform init -upgrade` to update the provider to the newest version matching the version constraint and update the lock file.

**Overall:**

The dependency lock file (`.terraform.lock.hcl`) pins the exact provider versions resolved during the last `terraform init`. Running `terraform init` without flags respects the lock file and continues using the pinned version, even if newer compatible versions exist. The `-upgrade` flag tells Terraform to ignore the lock file selections, check for the newest versions that satisfy your version constraints, download them, and update the lock file accordingly. Deleting the lock file manually is not recommended because it removes the checksum verification that protects against supply chain attacks.

---

### 21.
You manage 15 workspaces that all deploy to the same AWS account. You're tired of updating AWS credentials individually in each workspace every time they rotate. What steps should you take to simplify credential management? (select two)

> **Reference:** [Organize workspaces with projects and variable sets | Terraform | HashiCorp Developer](https://developer.hashicorp.com/terraform/tutorials/cloud-get-started/cloud-create-project)

**Response:**

- Create a variable set with the AWS credentials and scope it to the project.
  - Creating a variable set with the AWS credentials and scoping it to the project ensures that the credentials are securely stored and can be easily accessed by all workspaces within the project. This approach eliminates the need to manually update credentials in each workspace.
- Organize the workspaces into an HCP Terraform project.
  - Organizing the workspaces into an HCP Terraform project allows you to manage the AWS credentials in a centralized manner. You can update the credentials in one place and have them automatically applied to all workspaces within the project.

**Overall:**

HCP Terraform projects let you organize related workspaces into logical groups, and variable sets let you define reusable collections of variables that can be applied at different scopes. By grouping your workspaces into a project and then creating a project-scoped variable set containing your AWS credentials, every workspace in that project automatically inherits those values. When credentials need to rotate, you update them in one place — the variable set — and the change propagates to all workspaces in the project. Variable sets support three scopes: global (all workspaces in the organization), project-scoped (all workspaces in selected projects), and workspace-scoped (specific workspaces). If a particular workspace needs different credentials, you can still override the variable set by creating a workspace-specific variable with the same key.

---

### 22.
When creating a reusable module, which of the following are best practices? (select three)

**Response:**

- Document the module's purpose, inputs, and outputs.
- Create `output` values for important resource attributes that other modules might need.
- Define input variables for all values that might change between different uses.

**Overall:**

Creating reusable modules requires following several best practices. Input variables should be defined for any values that might differ between environments or use cases — this makes the module flexible and reusable. For example, a networking module should accept VPC CIDR blocks, subnet counts, and region as variables rather than hardcoding them. Output values should expose important resource attributes (like VPC IDs, subnet IDs, security group IDs) so that other modules or the root configuration can use them. Documentation is critical — a well-documented module includes descriptions of what it does, what inputs it requires, what outputs it provides, and usage examples. Provider blocks should NOT be included in reusable modules because this limits flexibility — the calling configuration should configure providers. Hardcoding values defeats the purpose of reusability.


![[Pasted image 20260619181659.png]]


![[Pasted image 20260619181828.png]]
https://www.terraform.io/language/expressions/splat 

![[Pasted image 20260619182005.png]]

![[Pasted image 20260619182528.png]]
https://www.terraform.io/cloud-docs/run/ui#automatically-starting-runs


FILL BLANK - **terraform.tfstate**

What is the name of the default file where Terraform stores the state?

Type your answer in the field provided. The text field is not case-sensitive and all variations of the correct answer are accepted.
![[Pasted image 20260619184313.png]]

You need to constrain the GitHub provider to version 2.1 or greater.

Which of the following should you put into the Terraform 0.12 configuration's provider block?

- [ ] A- version >= 2.1 

- [ ] B- version ~> 2.1

- [ ] C- version = "<= 2.1"

- [ ] D**- version = ">= 2.1"**

The answer is D ">= 2.1". Requires quotes I believe.

![[Pasted image 20260619185605.png]]

![[Pasted image 20260619190215.png]]

![[Pasted image 20260619190943.png]]

![[Pasted image 20260619191714.png]]
![[Pasted image 20260619191806.png]]

![[Pasted image 20260619192203.png]]

![[Pasted image 20260619192928.png]]
- By default, when `TF_LOG` is set, Terraform writes these logs to **stderr** (your terminal), not to syslog.

![[Pasted image 20260619193017.png]]

![[Pasted image 20260619193438.png]]

![[Pasted image 20260619193524.png]]

![[Pasted image 20260619193604.png]]
https://www.terraform.io/language/functions

![[Pasted image 20260619193703.png]]
