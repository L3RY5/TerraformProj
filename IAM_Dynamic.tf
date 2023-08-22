resource "aws_iam_user" "iam" {
  for_each = toset(["user-01", "user-02", "user-03"])
  name     = each.key
  path     = "/system/"

  tags = {
    Name = each.key
  }
}