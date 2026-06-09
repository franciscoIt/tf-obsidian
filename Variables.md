
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
![[www.udemy.com_course_hashicorp-certified-terraform-associate-004_learn_lecture_54388979 1.png]]

if it doesnt exists, it will request to input the value.