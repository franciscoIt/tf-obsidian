A **provisioner** in Terraform is a way to run scripts or commands on a resource as part of its creation or destruction — used to do setup work that Terraform's declarative resource model doesn't directly support (like bootstrapping software on a VM).

#### The three main types

**1. `local-exec`**  
Runs a command on the machine running Terraform (not on the resource itself).

hcl

```hcl
resource "aws_instance" "web" {
  # ...
  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt"
  }
}
```

**2. `remote-exec`**  
Runs commands _on_ the newly created resource (e.g., an EC2 instance), over SSH or WinRM.

hcl

```hcl
resource "aws_instance" "web" {
  # ...
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nginx"
    ]
  }
}
```

**3. `file`**  
Copies a file or directory from the local machine to the newly created resource.

hcl

```hcl
provisioner "file" {
  source      = "app.conf"
  destination = "/etc/app/app.conf"
}
```

`remote-exec` and `file` require a `connection` block specifying how to reach the resource (SSH key, host, user, etc.), since Terraform needs a way in.

#### When they run

By default, provisioners are **creation-time** — they run when the resource is created. You can flip this with `when = destroy` to make it a **destroy-time provisioner**, which runs right before the resource is torn down (useful for deregistering a node from a cluster, for example).

#### Failure behavior

If a provisioner fails, the resource is marked **tainted** by default — meaning Terraform will destroy and recreate it on the next apply. You can override this with `on_failure = continue` to ignore the error instead.

#### Important exam point: provisioners are a "last resort"

HashiCorp's own docs explicitly call provisioners a **last resort**, because they break Terraform's declarative model — Terraform can't track or manage what a script does, so there's no way to know the real state of the resource after the script runs. Preferred alternatives:

- Use **cloud-init / user_data** for instance bootstrapping
- Use dedicated config management tools (Ansible, Chef, Puppet)
- Bake configuration into a custom image (e.g., Packer)