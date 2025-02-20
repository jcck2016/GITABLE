#--- vpc/main.terraform---#

resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr_block
  
  
  }

resource "aws_subnet" "main_subnet" {
vpc_id = aws_vpc.main_vpc.id
availability_zone = var.availability_zone
cidr_block =  = var.subnet_cidr_block


  }

resource "aws_internet_gateway" "instance_igw" {
vpc_id = aws_vpc.main_vpc.id
  
}

resource "aws_route_table" "instance_rt" {
vpc_id = = aws_vpc.main_vpc.id
route = {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.instance_igw.vpc_id
}
  
}

resource "aws_route_table_association" "instance_rta" {
 subnet_id = aws_subnet.main_subnet.id
 route_table_id = aws_route_table.instance_rt.id   
  
}

