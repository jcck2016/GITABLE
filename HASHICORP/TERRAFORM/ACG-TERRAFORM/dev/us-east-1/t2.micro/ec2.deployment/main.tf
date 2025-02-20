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

