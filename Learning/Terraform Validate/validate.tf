#Terraform validate primarly checks whether a configuration is syntactically valid. It is used to validate the syntax of the code and to check if the code is properly written or not.
#It can check various aspects including syntax, type errors, and attribute references.
#syntax- terraform validate

provider "aws" {
  region = "us-east-1"
}



resource "aws_instance" "myec2" {
  ami           = "ami-082b5a644766e0e6f"
  instance_type = "t2.micro"
  
  
}