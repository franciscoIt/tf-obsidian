![[www.udemy.com_course_hashicorp-certified-terraform-associate-004_learn_lecture_54411575 (1).png]]

## Priority
![[www.udemy.com_course_hashicorp-certified-terraform-associate-004_learn_lecture_54411581 (3).png]]

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

