resource "aws_iam_user" "admin_user1" {

name = "mark russiviivch"
tags = {
  Description = "Technical Team Lead"
}

  
}

resource "aws_iam_policy" "adminuser1" {
name = "Adminuser1"
policy = file("admin-policy.json")

}

resource "aws_iam_user_policy_attachment" "mark-admin-access" {
   user = aws_iam_policy.adminuser1.name
  policy_arn = = aws_iam_policy.adminuser1.arn
}