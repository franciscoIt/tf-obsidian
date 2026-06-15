
# Variables

```yaml
	
variable "num_of_pets" {
	type = number
	description = "how many pets"
}

resource "random_pet" "name" {
	length = var.num_of_pets
}
```

Value is taken from an environment variable like:
![[variable-env-var.png]]

if it doesnt exists, it will request to input the value.

# Variable Block

![[variable-block.png]]

## Priority
![[variable-priority.png]]

## Referencing
list --> var.<name>[0]


## Types
type = string        # "us-east-1"
type = number        # 3
type = bool          # true
type = list(string)  # ["a", "b", "c"]
type = map(string)   # { key = "value" }
type = set(string)   # like list, but unordered and unique
type = object({      # structured shape
  name = string
  port = number
})
type = any           # disables type checking (avoid in production)

