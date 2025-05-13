provider "aws" {
  region     = "ap-south-1"

}


resource "aws_instance" "firststinstance" {
  ami           = "ami-0fd05997b4dff7aac"
  instance_type = "t2.micro"
  subnet_id     = "subnet-041efa01fa810dd42"  

  }
