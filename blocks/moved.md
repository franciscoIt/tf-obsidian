![[moved-block-detail.png]]


#### Why It Exists

Before `moved` blocks, renaming a resource meant Terraform would plan to destroy the old one and create a new one — causing downtime and data loss. The `moved` block solves this by recording the rename as an instruction Terraform follows during `plan`/`apply`.

#### Basic Syntax

hcl

```hcl
moved {
  from = aws_instance.old_name
  to   = aws_instance.new_name
}
```

#### Common Use Cases

**1. Renaming a resource**

hcl

```hcl
# Renamed "web_server" to "app_server"
moved {
  from = aws_instance.web_server
  to   = aws_instance.app_server
}

resource "aws_instance" "app_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.micro"
}
```

**2. Moving into a module**

hcl

```hcl
# Resource previously at root, now inside a module
moved {
  from = aws_s3_bucket.data
  to   = module.storage.aws_s3_bucket.data
}
```

**3. Moving between modules**

hcl

```hcl
moved {
  from = module.old_module.aws_s3_bucket.data
  to   = module.new_module.aws_s3_bucket.data
}
```

**4. Expanding to `count` or `for_each`**

hcl

```hcl
# Single resource becoming part of a for_each
moved {
  from = aws_iam_user.alice
  to   = aws_iam_user.employees["alice"]
}
```