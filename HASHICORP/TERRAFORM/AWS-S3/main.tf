resource "aws_s3_bucket" "finance" {

    bucket = "finance-bucket-00202502100a"

    tags = {
      description = "finance and payroll sample data"
      
    }
  
}