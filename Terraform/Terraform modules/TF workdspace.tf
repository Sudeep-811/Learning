# TF workspace enable us to manage multiple set of deployements from the same set of configuration file. It is used to create multiple instances of the same infrastructure in the same configuration file.
/*

#workspace commands-

terraform workspace (Shows all the available commands)
terraform workspace show (Shows the current workspace)
terraform workspace new dev (Creates a new workspace followed by the name of the workspace)
terraform workspace new prod (Creates a new workspace followed by the name of the workspace)
terraform workspace list (Lists all the available workspaces)
terraform workspace select dev (Selects the workspace followed by the name of the workspace)



*/

#Base Code

resource "aws_instance" "myec2" {
   ami = "ami-08a0d1e16fc3f61ea"
   instance_type = "t2.micro"
}

#Final Code

locals {
  instance_type = {
    default = "t2.nano"
    dev     = "t2.micro"
    prod    = "m5.large"
  }
}
# depending on the workspace being used, the valur to a specific argument in your terraform code can also be changed.
# eg- instance_type = local.instance_type[terraform.workspace]

resource "aws_instance" "myec2" {
  ami           = "ami-08a0d1e16fc3f61ea"
  instance_type = local.instance_type[terraform.workspace]
}