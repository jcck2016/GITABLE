#---instance/variable.tf---#

variable "instance_type" {
    description = "The type of instance to launch"
    type = string
  
}

variable "subnet_id" {
    description = "The subnet_id to launch the instance in"
    type = string
}

variable "instance_count" {
    description = "The number of instances to launch"
    type = number
}