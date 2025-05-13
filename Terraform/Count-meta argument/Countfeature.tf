#Count argument accepets a number and creates multiple resources with the same configuration.




resource "aws_instance" "EC2" {
    ami           = "ami-0fd05997b4dff7aac"
    instance_type = "t2.micro"
    subnet_id     = "subnet-041efa01fa810dd42"
    count = 3
}

#Challenges with count- you might want to customize the configuration of each resource created by count.