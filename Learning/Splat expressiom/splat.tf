#splat exp allows us to get a list of all the attrinutes.
# *-
# if replace splat * with index then it will return the value of the index. eg. aws_iam_user.lb[0].arn then it will provide the value of the arn of the first user.


provider "aws" {
  region     = "ap-south-1"
}
resource "aws_iam_user" "lb" {
  name = "iamuser.${count.index}"
  count = 3
  path = "/system/"
}

output "arns" {
  value = aws_iam_user.lb[*].arn
}