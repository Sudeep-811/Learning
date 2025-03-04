/* By deafult, a resource block configure one real infrastructure object. however, sometimes you may want to create multiple instances of the same resource type withour writing multiple resource blocks. This can be achieved using the for_each meta-argument.
TF has 2 ways to do this:
1- count meta-argument
2- for_each meta-argument

If a resource block includes a for_each meta argument whoes value is a map or a set of strings, Terraform will create an instance for each item in the set or map. The key of each item will be available in the each variable within the resource block.
*/

//base code-

variable "user_names" {
    type = set(string)
    default = ["alice","bob","john","james"]
}

resource "aws_iam_user" "this" {
    for_each = var.user_names
    name = each.value
}

//final code-

variable "my-map" {
    default = {
        key = "value"
        key1 = "value1"
    }
}

resource "aws_instance" "web" {
  for_each      = var.my-map
  ami           = each.value
  instance_type = "t3.micro"

  tags = {
    Name = each.key
  }
}

//In block where for_each is set, an additional each object is available which contains the following attributes:
//each.key - the key of the current map element (the map key or set number corresponding to this instance)
//each.value - the value of the current map element(the map value or set element corresponding to this instance)