#In typical TF workflow, you apply the entire plan at once. This is also the deault behavior of the terraform apply command.
#However, you can also apply the plan in parts by using the -target flag. This is useful when you want to apply only a part of the plan.
#Resource targeting is useful when you want to apply only a part of the plan. This is useful when you want to apply only a part of the plan rather than the entire plan.
/* Syntax- 

terraform plan -target local_file.foo
terraform apply -target local_file.foo
terraform destroy -target local_file.foo

*/

resource "aws_iam_user" "this" {
  name = "test-aws-user"
}

resource "aws_security_group" "allow_tls" {
  name        = "terraform-firewall"
}

resource "local_file" "foo" {
  content  = "foo!"
  filename = "${path.module}/foo.txt"
}