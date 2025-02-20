#--- vpc/output.tf ---#

output "vpc_id" {
    description = "value of the vpc_id"
  value = aws_vpc.main_vpc.id
}   

output "subnet_id" {
    description = "value of the subnet_id"
  value = aws_subnet.main_subnet.id
}


