/*challenges- 1- Hardcoded values in the code.
If devloper want to change the instance type, region or ami they have to change the code and redeploy the code.

2- Provider imporvement
we hardcoded the region in the code and we cannot change the region without changing the code. 

SO OVERALL AVOID HARDCODING VALUES IN THE CODE.

A required_providers block is used to specify all providers required by the TF code. You can further fine tune to include a specific version of the provider plugin.


For Modules, It is  recommened to convert hard coded value to 'variables' and use them in the code.
*/
#soultion to challenge-1
#base-code

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "myec2" {
    ami = "ami-0bb84b8ffd87024d8"
    instance_type = "t2.micro"
}


#good approch to use variables in the code.


provider "aws" {
  region = var.region
}

resource "aws_instance" "myec2" {
    ami = var.ami
    instance_type = var.instance_type
}


variable "ami" {}
variable "instance_type" {}
variable "region" {}

#soultion to challenge-2

#basecode- 

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "myec2" {
    ami = "ami-0bb84b8ffd87024d8"
    instance_type = "t2.micro"
}


#final-code 


terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.50"
    }
  }
}

resource "aws_instance" "myec2" {
    ami = var.ami
    instance_type = var.instance_type
}


variable "ami" {}
variable "instance_type" {}
variable "region" {}

