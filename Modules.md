[Modules docs](https://registry.terraform.io/browse/modules)

```json 
project/
├── main.tf             ← root module
├── variables.tf
├── outputs.tf
└── modules/
    └── vpc/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
        
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.0"

  name = "my-vpc"
  cidr = "10.0.0.0/16"
  azs  = ["us-east-1a", "us-east-1b"]
}
```

![[modules-overview.png]]
![[modules-structure.png]]

![[modules-passing-data-to-child.png]]

![[modules-child-output-to-root.png]]


## Local modules
local modules are inside `terraform/`

![[modules-local-source-example.png]]
![[project-file-structure.png]]

