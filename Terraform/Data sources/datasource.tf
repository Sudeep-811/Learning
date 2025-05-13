#data source allow terraform to use /fetch information defined outside of terraform.
#data source is acccessed via special kind of resouce know as a data resouce, declared using a 'data' block.
#1-Below is an example of how to use data source to fetch account information from digitalocean.

/*
terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
    }
  }
}

provider "digitalocean" {
  token = "your-token-here"
}


data "digitalocean_account" "example" {}
*/




# 2-follwoing is an example of how to use data source to fetch information from local file.
#${path.module} is used to get the current directory path where code is located.

/*
data "local_file" "foo" {
  filename = "${path.module}/demo.txt"
}
# if need to read content on CLI the add-

output "data" {
    value = data.local_file.foo.content
}
*/






# 3-Another example of data source to fetch information about aws ec2 in your aws region.

/*
provider "aws" {
    region = "ap-south-1"
}

data "aws_instances" "example" {}
*/



#4- sometimes we need to use data source to filter the information we need. Below is an example of how to use data source to filter the information.

/*
provider "aws" {
    region = "ap-south-1"
}

data "aws_instance" "example" {
 filter {
    name   = "tag:Team"
    values = ["Production"]
  }
}
*/