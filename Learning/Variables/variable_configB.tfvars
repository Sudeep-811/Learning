#(variable defination file) terrafrom.tfvars- file that defines value to all the variables (only values, no variables)

#If you have multiple variable definition files (*.tfvars), you can manually define the file to use during CLI- [terraform plan -var-file="prod.tfvars"]
#If the file name is terraform.tfvars-> Terraform will automatically load value from it. 
#If file name is different the you have to excplicitly define the file during plan/ apply operation. (Line 2)
#make sure to follow step 2 for this case

ami = "ami-0fd05997b4dff7aac"
description = "ap-south-1 region"


#Ways to declare variable values=
#1- Variable defaults
#2-(variable defination file) terrafrom.tfvars
#3-Environment variables- TF_VAR_<VARIABLENAME>
#4- Via CLI

/*terrafrom loads variable in following order-
1- any -VAR and -VAR-FILE option on CLI
2-any *.auto.tfvars or *.autotfvars.json files, processed in lexical order of their filenames
3- The terraform.tfvars.json file, if present
4- The terraform.tfvars file, if present
5- Environment variables */

