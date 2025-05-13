#while using count you can also use the count.index variable to customize the configuration of each resource.
#it can be used to create multiple resources like instance or IAM users with different tags/name. 


/*
resource "aws_instance" "EC2insatance" {
    ami           = "ami-0fd05997b4dff7aac"
    instance_type = "t2.micro"
    subnet_id     = "subnet-041efa01fa810dd42"
    count = 3

    tags = {
        Name = "EC2-${count.index}"
    }   
}

#for iam user

resource "aws_iam_user" "test" {
    name = "user-${count.index}"
    count = 3
}

*/


#you can use count.index to iterate through the list to have more customization. 

variable "dev_name" {
    type = list
    default = ["dev1","dev2","dev3"]
  
}

resource "aws_iam_user" "test" {
    name = var.dev_name[count.index]
    count = 3
}