# count

`count` creates **multiple instances of a resource** using a simple number. It's the simpler alternative to `for_each`

```json
resource "aws_instance" "example" {
  count = 3   # creates 3 instances

  ami           = "ami-12345678"
  instance_type = "t3.micro"

  tags = {
    Name = "server-${count.index}"  # 0, 1, 2
  }
}
```

With a conditional:

```json
resource "aws_eip" "nat" {
  count = var.environment == "prod" ? 1 : 0  # only in prod
}
```
