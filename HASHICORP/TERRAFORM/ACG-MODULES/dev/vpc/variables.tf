#--- vpc/variables.tf ---#

variable "availability_zone" {
    type = string

}

variable "vpc_cidr_block" {
    type = string
}

variable "subnet_cidr_block" {
    type = string
}