variable "location" {
  type    = string
  default = "East US"
}

variable "ssh-source-address" {
  type    = string
  default = "*"
}

variable scfile{
    type = string
    default = "script.sh"
}

variable "computer_name" {
  default = "hostname"
}

variable "admin_password" {
  default = "Password1234!"
}

variable "imagename" {
  type    = string
  default = "Devops_VM-image-randam-20210513091936"
}

variable "numberOfWorkerNodes" {
  type = number
  default = 1
}


