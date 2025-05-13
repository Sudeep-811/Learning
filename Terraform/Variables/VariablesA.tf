
#variable.tf - file defines all the variable (only variable, no value)


variable "vpc_id" {
    default = "101.20.30.100/32"
    description = "This is VPN ID that needed to be whitelist for the given ports in AWS"
  
}

variable "app_port" {
    default = "8080"
  
}

variable "ssh_port" {
    default = "22"
  
}

variable "ftp_port" {
    default = "21"
  
}

variable "rdp_port" {
    default = "443"
  
}