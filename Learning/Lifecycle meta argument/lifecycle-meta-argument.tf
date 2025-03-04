/*
TF allows us to include meta-arguments in the lifecycle block of a resource which allows us to control how Terraform manages the lifecycle of that resource. 
These meta-arguments provide additional control over the creation, update, and deletion of resources.
syntax-

lifecycle {
        ignore_changes = [tags]
    }   
    it will ignore tags specific changes


*/
//base code=


provider "aws" {
  region     = "us-east-1"
}

resource "aws_instance" "myec2" {
    ami = "ami-0f34c5ae932e6f0e4"
    instance_type = "t2.micro"

    tags = {
        Name = "HelloEarth"
    }
}


//final code= 

provider "aws" {
  region     = "us-east-1"
}

resource "aws_instance" "myec2" {
    ami = "ami-0f34c5ae932e6f0e4"
    instance_type = "t2.micro"

    tags = {
        Name = "HelloEarth"
    }

    lifecycle {
        ignore_changes = [tags]
    }
}


/* 
There are multiple meta-arguments -
depends_on- can be used to specify that a resource depends on another resource. When creating resources, which require other resources to exist first.
count -If we want multiple resources with same configurations, we can define the count meta-argument
for_each -An infrastructure resource can be replicated in a more flexible way using the for_each meta-argument. A resource block, a data block, or a module block can use it. It works with a map or a set of strings, and it creates an instance for each item in the set.
provider -This meta-argument allows you to specify a specific provider configuration for a resource or module. The purpose of this is to associate a resource with a specific provider if you have defined multiple providers in your Terraform configuration.
lifecycle -The arguments available within a lifecycle block are create_before_destroy, prevent_destroy, ignore_changes, and replace_trigger_by.
*/
//Arguments available in the lifecycle block in Terraform
/*
1- create_before_destroy	=Ensures that a new resource is created before the old one is destroyed during updates. Useful to avoid downtime in resources that require in-place updates.
2- prevent_destroy	=Prevents Terraform from destroying the resource, ensuring it is not accidentally deleted, even when the configuration changes.
3- ignore_changes	=Specifies which resource attributes should be ignored during updates. This prevents Terraform from modifying those attributes if they change externally.
4- replace_triggered_by	=Defines a list of resources or expressions that will trigger the replacement (destroy and recreate) of the resource if they change.
*/

//1- create_before_destroy- basecode-

provider "aws" {
  region     = "us-east-1"
}

resource "aws_instance" "myec2" {
    ami = "ami-0f34c5ae932e6f0e4"
    instance_type = "t2.micro"

    tags = {
        Name = "HelloEarth"
    }
}

//final code-

provider "aws" {
  region     = "us-east-1"
}

resource "aws_instance" "myec2" {
    ami = "ami-0f34c5ae932e6f0e4"
    instance_type = "t2.micro"

    tags = {
        Name = "HelloEarth"
    }

    lifecycle {
      create_before_destroy = true
    }
}

//2- prevent_destroy- base code-

provider "aws" {
  region     = "us-east-1"
}

resource "aws_instance" "myec2" {
    ami = "ami-0f34c5ae932e6f0e4"
    instance_type = "t2.micro"

    tags = {
        Name = "HelloEarth"
    }
}

//final code-

provider "aws" {
  region     = "us-east-1"
}

resource "aws_instance" "myec2" {
    ami = "ami-0f34c5ae932e6f0e4"
    instance_type = "t2.micro"

    tags = {
        Name = "HelloEarth"
    }

    lifecycle {
      prevent_destroy = true
    }
}

//3- ignore_changes- base code-

provider "aws" {
  region     = "us-east-1"
}

resource "aws_instance" "myec2" {
    ami = "ami-0f34c5ae932e6f0e4"
    instance_type = "t2.micro"

    tags = {
        Name = "HelloEarth"
    }
}

//final code- (Manual Added Attribute List)


provider "aws" {
  region     = "us-east-1"
}

resource "aws_instance" "myec2" {
    ami = "ami-0f34c5ae932e6f0e4"
    instance_type = "t2.micro"

    tags = {
        Name = "HelloWorld"
    }

    lifecycle {
      ignore_changes = [tags,instance_type]
    }

}

//final code-(Using ALL)

provider "aws" {
  region     = "us-east-1"
}

resource "aws_instance" "myec2" {
    ami = "ami-0f34c5ae932e6f0e4"
    instance_type = "t2.micro"

    tags = {
        Name = "HelloWorld"
    }

    lifecycle {
      ignore_changes = all
    }

}