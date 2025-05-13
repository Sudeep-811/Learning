
#Graph referes to thw visual representation of the infrastructure that is being created by the terraform code.
#Terraform graph command is used to generate the visual representation of the infrastructure that is being created by the terraform code.
/*
terraform graph
apt install graphviz
terraform graph | dot -Tsvg > graph.svg
*/

resource "aws_eip" "lb" {
  domain   = "vpc"
}

resource "aws_security_group" "example" {
  name        = "attribute-sg"
}

resource "aws_vpc_security_group_ingress_rule" "example" {
  security_group_id = aws_security_group.example.id

  cidr_ipv4   = "${aws_eip.lb.public_ip}/32"
  from_port   = 443
  ip_protocol = "tcp"
  to_port     = 443
}

resource "aws_instance" "web" {
  ami           = "ami-0440d3b780d96b29d"
  instance_type = "t2.micro"
}