# Relative References

```json
# Reference a specific instance
output "first_ip" {
  value = aws_instance.web[0].public_ip
}

# Reference all instances (returns a list)
output "all_ips" {
  value = aws_instance.web[*].public_ip  # splat expression
}

# Same with for expression
output "all_ids" {
  value = [for i in aws_instance.web : i.id]
}
```