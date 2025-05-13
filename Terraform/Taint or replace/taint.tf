
/*
Use case- 

you have created the new resource using TF.
users have made a lot a maual changes (both infrastructed and inside the server itself. 
Now two way to deal with this situation- 1 import changes to, TF 2 destroy the resource and recreate it.
  
The -replace option with TF apply to force TF to replace an object even though there are no confuing changes that would require it.
syntax- terraform apply -replace="aws_instance.myec2"
  


*/

provider "aws" {
  region     = "ap-south-1"
}

resource "aws_instance" "myec2" {
    ami = "ami-00c39f71452c08778"
    instance_type = "t2.micro"
}
