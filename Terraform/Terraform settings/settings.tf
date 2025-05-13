#we use provider block to define various aspects of thr provider like region, access key, secret key etc.
#Terraform settings are used to configure the backend, define the required provider, and set the version of the terraform to be used.
#The required_providers block is used to specify all providers required by the TF code. You can further fine tune to include a specific version of the provider plugin" 

#base code-
resource "aws_security_group" "sg_01" {
  name = "app_firewall"
}

#final code-
terraform {
  required_version = "1.9.1"

  required_providers {
    aws = {
      version = "5.54.1"
      source = "hashicorp/aws"
    }
  }
}

resource "aws_security_group" "sg_01" {
  name = "app_firewall"
}
