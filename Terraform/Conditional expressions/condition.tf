#condition expression allow you to choose between two values based on the value of a condition
#syntax: condition ? value_if_true : value_if_false

#example, if env is dev, t2.micro if not dev than m5.large
/*
variable "environment" {
  default = "development"
}

resource "aws_instance" "myec2" {
 ami = "ami-0fd05997b4dff7aac"
 instance_type = var.environment == "development" ? "t2.micro" : "m5.large" 
}
*/

#Using  multiple variables- eg-  if env=prod and region=ap-south-1, then use t2.micro, else use m5.large


variable "environment" {
  default = "production"
}
variable "region" {
  default = "ap-south-1"
}


resource "aws_instance" "myec2" {
 ami = "ami-0fd05997b4dff7aac"
 instance_type = var.environment == "production" && var.region == "ap-south-1" ? "t2.micro" : "m5.large" 
}