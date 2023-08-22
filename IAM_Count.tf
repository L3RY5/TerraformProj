resource "aws_iam_user" "IAMLocal" {
  name = var.IAM_names_LIST[count.index]
  count = 3
  path = "/system/"

  tags = {
    Name = "foobar-terraform-elb"
  }
}