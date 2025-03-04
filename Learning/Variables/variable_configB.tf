



resource "aws_instance" "ec2" {
  ami           = var.ami
  instance_type = "t2.micro"
  subnet_id     = "subnet-041efa01fa810dd42"  

  }