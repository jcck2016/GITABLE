provider "aws" {
region = "us-east-1"
access_key = ""
secret_key = ""

  
}



resource "aws_iam_user" "admin_user1" {

name = "mark russiviivch"
tags = {
  Description = "Technical Team Lead"
}

  
}

resource "aws_iam_user" "admin_uesr2" {

name = "bill gates"
tags = {
  Description = "Giant Boss guy"
}
 
}

resource "aws_iam_policy" "adminuser1" {
name = "Adminuser1"
policy = <<EOF
{
   "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "ec2:*",
            "Effect": "Allow",
            "Resource": "*"
        }
        ]
        }
EOF

}

resource "aws_iam_user_policy_attachment" "mark-admin-access" {
    user = aws_iam_user.admin_user1.name
    policy_arn = aws_iam_user.admin_user1.arn
  
}