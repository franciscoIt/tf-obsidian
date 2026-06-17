- Needs creds for the back ends 
## Migrate to remote backend
`terraform init -migrate-state`
terraform.tfstate can use a remote backend

![[state-remote-backend.png]]



## Lost tf state
![[state-lost.png]]

.- updates the state but not the files
![[state-import-1.png]]

![[state-import-2.png]]
