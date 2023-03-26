provider "aws" {
  region = "ap-south-1"
}

#-----------------------------------------------
# GENERATE AN IAM POLICY DOCUMENT IN JSON FORMAT
#-----------------------------------------------
data "aws_iam_policy_document" "writeonly" {
  statement {
    effect    = "Allow"
    actions   = ["ec2:*" ]
    resources = ["*"]
  }
}

# -------------------
# CREATE A IAM POLICY
# -------------------
resource "aws_iam_policy" "writeonly" {
  name = "writeonly_policy"
  path = "/"
  policy = data.aws_iam_policy_document.writeonly.json
}

