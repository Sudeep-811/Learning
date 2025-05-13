#Formmating is important for the readibility of the code and to make it more understandable. Terraform fmt command is used to re-write the code files to take care of the overall formatting.
#before  fmt- 

provider "aws" {
       region     = "ap-south-1"
  access_key          = "YOUR-ACCESS-KEY"
  secret_key = "YOUR-SECRET"
}

resource "aws_instance" "myec2" {
  ami           = "ami-082b5a644766e0e6f"
  instance_type = "t2.micro"
}

#after fmt- 

provider "aws" {
  region     = "ap-south-1"
  access_key = "YOUR-ACCESS-KEY"
  secret_key = "YOUR-SECRET"

}

resource "aws_instance" "myec2" {
  ami           = "ami-082b5a644766e0e6f"
  instance_type = "t2.micro"
}