resource "aws_s3_bucket" "finance" {

    bucket = "finance-bucket-00202502100a"

    tags = {
      description = "finance and payroll sample data"
      
    }
  
}

resource "aws_s3_bucket" "marvel-cinematic-universe" {
  bucket = "mcu-202011121359"

}

resource "aws_s3_bucket" "pixar-stduios" {
  bucket = "pixar-studios"

}


resource "aws_s3_object" "upload-test" {

bucket = "pixar-studios"
key = "test.txt"
source ="/home/cloudshell-user/aws-s3-tf/test.txt"

  //content = "/home/cloudshell-user/aws-s3-tf/test.txt"
 // key ="test.txt"
//bucket = aws_s3_bucket.finance.id
}