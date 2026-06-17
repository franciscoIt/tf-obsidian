default 
```json
lifecycle {
	destroy= true
	}
}
```

A `moved` block in Terraform lets you **rename or relocate resources in your state file without destroying and recreating them**. It tells Terraform "this resource used to be called X, now it's called Y — treat them as the same thing."

![[removed-block-workflow.png]]


![[moved-removed-block-decision-guide.png]]