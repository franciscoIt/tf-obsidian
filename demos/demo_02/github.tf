provider "github" {
  token = var.github_token
}

resource "github_repository" "production-repo" {
  name        = "prod-demo"
  description = "Repo for demo"
  private     = true
}


resource "github_repository" "testing-repo" {
  name        = "test-demo"
  description = "Repo for demo"
  private     = true
}