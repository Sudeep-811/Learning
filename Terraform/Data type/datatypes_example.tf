

variable "example_string" {
    description = "An example of a string variable"
    type        = string
    default     = "Hello, Terraform!"
}

variable "example_number" {
    description = "An example of a number variable"
    type        = number
    default     = 42
}

variable "example_bool" {
    description = "An example of a boolean variable"
    type        = bool
    default     = true
}

/*
The list data type in Terraform is used to store multiple values of the same type.
Lists are defined using square brackets [] and elements are separated by commas.
Each element in a list must be of the same type.
Lists are ordered collections, meaning the order of elements is preserved.
We can also specify the type of values expected in the list:
  - list(string): Only strings are allowed in the list.
  - list(number): Only numbers are allowed in the list.
*/



variable "example_list" {
    description = "An example of a list variable"
    type        = list(string) 
    default     = ["apple", "banana", "cherry"]
}



variable "example_map" {
    description = "An example of a map variable"
    type        = map(string)
    default     = {
        name  = "John Doe"
        email = "john.doe@example.com"
    }
}

variable "example_set" {
    description = "An example of a set variable"
    type        = set(string)
    default     = ["cat", "dog", "fish"]  //sets can only have unique values, any duplicate are automatically removed.
    // set does not store the order of the elements. Terraform only tracks the presence or absence of an element in the set, not their order.


}

variable "example_object" {
    description = "An example of an object variable"
    type        = object({
        id   = number
        name = string
    })
    default = {
        id   = 1
        name = "example"
    }
}

variable "example_tuple" {
    description = "An example of a tuple variable"
    type        = tuple([string, number, bool])
    default     = ["example", 123, false]
}


#make sure you use the correct data type for the variable and the default value with correct brackers and quotes.
#The map data type in Terraform is used to store key-value pairs.
#As tags are key-value pairs, we can use a map to define tags for resources.


variable "insatace_tags" {
    description = "An example of a complex map variable"
    type        = map
    default = {
        Name        = "example-instance" #key = Name, value = example-instance
        Environment = "production"       #key = Environment, value = production
        Owner       = "John Doe"         #key = Owner, value = John Doe
}
}