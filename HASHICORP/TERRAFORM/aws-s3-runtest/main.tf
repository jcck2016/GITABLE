resource "aws_s3_bucket" "finance2" {

    bucket = "finance2-bucket-00202502100a"

    tags = {
      description = "finance2 and payroll sample data"
      
    }
  
}



resource "aws_s3_bucket" "marketing" {

    bucket = "marketing-bucket-00202502100a"

    tags = {
      description = "marketing sample data"
      
    }
  
}


resource "aws_s3_bucket" "tech" {

    bucket = "tech-bucket-00202502100a"

    tags = {
      description = "tech dept sample data"
      
    }
  
}


