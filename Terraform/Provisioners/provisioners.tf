/*-Provisioners are used to excute scripts on a local or remote machine as part of resource creation or destruction. (step 1 - launch of VM, step 2- installation of software on VM)
eg. After a VM is launched- install software, to run a configuration management tool, or to run a script.
In step 2. TF login to VM via SSH to install required packaged/run scripts.

-There are majorly 3 types of provisioners:
1. Local-exec: It runs the script on the machine where TF is running. (eg. After VM is launched, fetch the IP of the VM and store it in a file on the local machine)
2. Remote-exec: It runs the script on the machine which is created by TF.(eg. After VM is launched, install Apache on the VM)
3. File: It is used to copy files or directories from local to remote machine.
 local and remote-exec are major ones

-Provisioners are used inside the resource block.
-Provisioners are defined by "provisioner" followed by the type of provisioner.
-For local provisiones, we have to specify command that need to run locally.
-For remote provisioners, we have to specify connection details like host, username, password, private key etc.
*/


#Aim- We need to launch an vm and store the Public IP of the VM in a file on the local machine.
/*
resource "aws_instance" "myec2" {
   ami = "ami-0d682f26195e9ec0f"
   instance_type = "t2.micro"
   subnet_id = "subnet-041efa01fa810dd42"

   provisioner "local-exec" {
    command = "echo ${aws_instance.myec2.public_ip} >> public_ips.txt"
  }
}
*/


#Aim- We need to launch an vm and install Apache on the VM.

resource "aws_instance" "myec2" {
   ami = "ami-0d682f26195e9ec0f"
   instance_type = "t2.micro"
   subnet_id = "subnet-041efa01fa810dd42"
   key_name = "terraform_key"

 connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key  = file("./terraform_key.pem")
    host    = aws_instance.myec2.public_ip
  }

 provisioner "remote-exec" {
    inline = [
      "sudo yum -y install nginx",
      "sudo systemctl start nginx",
    ]
  }
}

/*
We can also use provisioners in other resource blocks with multiple provisioners in a single resource block- 
eg. 

resource "aws_iam_user" "lb" {
  name = "demoiamuser"

  provisioner "local-exec" {
    command = "echo local-exec provisioner is starting"
  }

  provisioner "local-exec" {
    command = "echo local-exec provisioner is starting for 2nd time"
  }
}

*/


/*
By deafult providoner runs when the resource they are defines within is created.
Creation-time provisioners are only run during creation, not during updating or any other lifecycle.
Destroy-time provisioners are run before the resource is destroyed. (eg. remove antivirus software before destroying the VM.)
*/

resource "aws_iam_user" "lb" {
  name = "provisioner-user"

  provisioner "local-exec" {
    command = "echo This is creation time provisioner"
  }

  provisioner "local-exec" {
    command = "echo This is destroy time provisioner"
    when    =  destroy
  }
}

#if a creation time provisioner fails, the resource is marked as tainted and will be destroyed and recreated on the next apply.

/*
By deafault, provisioners taht fail will also cause the Terraform apply to fail. this will lead to resouce being marked as tainted and will be destroyed and recreated on the next apply.
We can use "on_failure" attribute to change this behaviour.
Continue: It will continue to apply the configuration even if the provisioner fails.
Fail: It will fail the apply if the provisioner fails.
Ignore: It will ignore the failure of the provisioner and will not fail the apply.  
*/
#below code will fail but we used on_failure = continue so it will not fail the apply.
resource "aws_iam_user" "lb" {
  name = "demo-provisioner-user"

  provisioner "local-exec" {
    command = "echo1 This is creation time provisioner"
    on_failure = continue
  }
}