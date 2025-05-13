#TF allows saving a plan to a file. [terraform plan -out infra.plan]
#After that you can run the terraform apply by refrencing the plan file. [terraform apply infra.plan]
#this ensures the infra. state remians exactly as shown in the plan to ensure the consistency." 
# The saved terraform plan file is a binary file and cannot be read by a human. You can use the terraform show command to see the contents of the plan file.
# many organizations required documented proof of plan changes before implementing them. This is where the terraform plan file comes in handy.

resource "local_file" "foo" {
  content  = "Hello World 2"
  filename = "terraform2.txt"
}