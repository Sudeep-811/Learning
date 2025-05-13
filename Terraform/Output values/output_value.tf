
#Output values makes information about your infra. availiable on the CLI and can expose info. for other terraform config. to use.
  /*
output "public-ip" {
  value = aws_eip.lb.public_ip    #showing only public ip of eip. If we remove attribute to value = aws_eip.lb , it will show all the attributes
  provided in resource type (eip)
}

Output values defined in one project can be ref. from code in another project

*/


provider "aws" {

}

resource "aws_eip" "lb" {
  
  domain   = "vpc"
}


output "public-ip" {
  value = aws_eip.lb.public_ip
}