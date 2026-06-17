1. Variable validation
2. Precondition
3. Postconditions
4. Checks

![[validations-decision-guide.png]]

# Variable validation
- Format requirements.
- Inputs in acceptable ranges
- Prevents tf operations if missconfigured variables.
- Displays `error_message`.
- blocks on `plan`

```json
variable "v_name" {
	values = <expresion>
	
	validation {
		condition = <expresion to verify> 
		error_message = "error string"
		}
	}
```

## Examples
![[validation-example-location.png]]
![[validation-example-cpu-count.png]]
![[validation-example-instance-type.png]]

## Preconditions / Postconditions
![[preconditions-postconditions-overview.png]]

### Examples
![[precondition-example-azure.png]]

#### notice the self
![[postcondition-example-self.png]]
