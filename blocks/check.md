lets you define **assertions about your infrastructure that run after every apply but never block it**.

![[check-block-overview.png]]

## Examples
```json
check "health_check" {
  data "http" "app" {
    url = "https://${aws_instance.app.public_ip}/health"
  }

  assert {
    condition     = data.http.app.status_code == 200
    error_message = "App health check failed with status ${data.http.app.status_code}."
  }
}
```

