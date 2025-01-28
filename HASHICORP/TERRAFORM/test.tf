module "name" {
  
}

provider "" {
  
}

resource "aws_instance" "webserver" {
  
}

resource "local_file" "pet" {
    content = "we love pet"
    directory_permission = "0777"
    file_permission = "0777"
    filename = "/root/pets.txt"
    id ="cdb335swdrt233e33q2449044-454-446785"
  
}

resource "aws_s3_bucket" "databucket" {
    bucket = "webserver-bucket-org-20333"
    acl ="private"
  
}