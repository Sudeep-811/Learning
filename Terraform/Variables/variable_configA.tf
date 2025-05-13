
 #variable_config- file contains main config. of infra. 
 
 # TF input variables are used to pass certain values from outside of the configuration. For this we define repeated static value (ipv4 in this case) in one central place. 
 # Syntax-  Var.NAMEOFVARIABLE


 provider "aws" {

}

resource "aws_security_group" "allow_tls" {
  name        = "Terraform-firewall"
  vpc_id      = "vpc-088693815cd5fe492"

  
  }

  resource "aws_vpc_security_group_ingress_rule" "app_port" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.vpc_id
  from_port         = var.app_port
  ip_protocol       = "tcp"
  to_port           = var.app_port
} 


 resource "aws_vpc_security_group_ingress_rule" "ssh_port" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.vpc_id
  from_port         = var.ssh_port
  ip_protocol       = "tcp"
  to_port           = var.ssh_port
} 


 resource "aws_vpc_security_group_ingress_rule" "ftp_port" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.vpc_id
  from_port         = var.ftp_port
  ip_protocol       = "tcp"
  to_port           = var.ftp_port
} 

 resource "aws_vpc_security_group_ingress_rule" "rdp_port" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.vpc_id
  from_port         = var.rdp_port
  ip_protocol       = "tcp"
  to_port           = var.rdp_port
} 