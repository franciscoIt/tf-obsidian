# Log levels
**JSON
1. TRACE
2. DEBUG 
3. INFO
4. WARN 
5. ERROR
```shell
	export TF_LOG=TRACE // Linux
	$env:TF_LOG="TRACE" // Powershell
	
	terraform plan 
	<detailed logs> 
```

# Separate Core and provider logging
`TF_LOG_PROVIDER=<LEVEL>`
`TF_LOG_CORE=<LEVEL>`
![[debugging-log-core-provider.png]]

# Saving logs to a file
Path --> `TF_LOG_PATH` 
- Logs must be settled.
	`TF_LOG_PROVIDER=<LEVEL>`
	`TF_LOG_CORE=<LEVEL>`
- Appended.
- Created automatically