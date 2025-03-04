#variable.tf (variable defaults) - file defines all the variable (only variable, no value)
#If variable value is not defined then terraform will ask for the variable value in CLI during plan/apply oepration. 

variable "ami" {}
variable "description" {}

