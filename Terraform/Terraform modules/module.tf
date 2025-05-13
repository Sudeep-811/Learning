#DRY-Don't Repeat Yourself

#tf modules allows us to centralize the resource configuration and reuse it across multiple environments. 
/* 
when do not want to write code from scratch you can use modules to write , just enter the sourcec code for modeule (github link) and version of the module you want to use. eg below-
*/

module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.7.1"
}

#some resource eg-eks cluster do not only required module but some other values also to specify in the code eg- cluster name or subnet id .

#In order to refrence/call a module you need to make use of 'Module' block. The block must contaoins the source argument which specifies the location of the module.
  
/*
eg-

module "ec2" {
  source = "github.com/zealvora/sample-kplabs-terraform-ec2-module"
}

*/

# Module source can be- local path, S3 bucket, http urls, terraform repository, git repository, git repository with specific tag, git repository with specific branch, git repository with specific commit hash, git repository with specific version.