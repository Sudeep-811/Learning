#Ensure to include output values in the module code for better flexibility and intergrationn with other terraform code.

# Fortmat- module.<MODULE_NAME>.<OUTPUT_NAME>
/*
Diff b/w Root Module and Child Module- 

Root Module- It resides in the main working directory of your TF configuration. It is the entry point of your infrastructe defination.
eg- 

module "ec2" {
  source = "../../modules/ec2"
}

Child Module- A module that has beeen called by another module is called a child module.
eg-

resource "aws_instance" "myec2" {
    ami = var.ami                                                 
    instance_type = var.instance_type
} 

#root module calling child moudule to create infrastrucutre.

*/

#Base Code of Child Module

resource "aws_instance" "myec2" {
    ami = "ami-08a0d1e16fc3f61ea"
    instance_type = "t2.micro"
}

#Base Code of ROOT Module

provider "aws" {
  region = "us-east-1"
}

module "ec2" {
  source = "../../modules/ec2"
}

resource "aws_eip" "this" {
  domain  = "vpc"
}

#Final Code of Child Module

resource "aws_instance" "myec2" {
    ami = "ami-08a0d1e16fc3f61ea"
    instance_type = "t2.micro"
}

output "instance_id" {
    value = aws_instance.myec2.id
}


#Final Code of Root Module

provider "aws" {
  region = "us-east-1"
}

module "ec2" {
  source = "../../modules/ec2"
}

resource "aws_eip" "this" {
  domain  = "vpc"
  instance = module.ec2.instance_id
}