#we want terraform to fetch the latest ami id for our ec2 instance using data source to avoide hardcoding the ami id.

provider "aws" {
  region = "ap-south-1"
}

data "aws_ami" "myimage" {
  most_recent      = true
  owners           = ["amazon"]

  #ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-* we used -* as a wild card as images version can be changed in future.

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.myimage.image_id
  instance_type = "t2.micro"
}