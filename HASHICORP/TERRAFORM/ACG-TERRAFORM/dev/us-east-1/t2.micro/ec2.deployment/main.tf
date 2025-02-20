#----- root/main.tf ------#
provider "aws" {
  region = local.location
}



locals {
  cwd           = reverse(split("\\", path.cdw))
  instance_type = local.cdw[1]
  location      = local.cdw[2]
  environment   = local.cdw[3]


}

module "instance" {
  source = "..\\..\\..\\..\\..\\acg-modules\\dev\\instance"
    instance_type = local.instance_type
    instance_count = 2
    
}
#---terrafomr module lesson 2:25---#
