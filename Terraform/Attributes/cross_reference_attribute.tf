
# Cross Refrence attributes- Terraform allow us to refrence the attribute of one resource to be used in a different resource
#SYNTAX-  <RESOURCE TYPE>.<NAME>.<ATTRIBUTE>



provider "aws" {

}

resource "aws_eip" "lb" {
  
  domain   = "vpc"
}


resource "aws_security_group" "allow_tls" {
  name        = "attribute-SG"
  vpc_id      = "vpc-088693815cd5fe492"

  
  }

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "${aws_eip.lb.public_ip}/32"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}


#1st step- compute eip via-                 (cidr_ipv4         = aws_eip.lb.public_ip)
#2nd once computed- (15.207.227.172),change (cidr_ipv4         = aws_eip.lb.public_ip/32)  CIDR is IMP
#1+#2= SYNTAX- "${aws_eip.lb.public_ip}/32" = string interpolation ${} -this syntx indicates that terraform will replace the expression inside curly brackets with its calculated value