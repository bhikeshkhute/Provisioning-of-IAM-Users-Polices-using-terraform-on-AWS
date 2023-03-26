provider "aws" {
  region = "ap-south-1"
}

#-----------------------------------------------
# GENERATE AN IAM POLICY DOCUMENT IN JSON FORMAT
#-----------------------------------------------
data "aws_iam_policy_document" "readonly" {
  statement {
    effect    = "Allow"
    actions   = ["ec2:Describe*" ]
    resources = ["*"]
  }
}

# -------------------
# CREATE A IAM POLICY
# -------------------
resource "aws_iam_policy" "readonly" {
  name = "readonly_policy"
  path = "/"
  policy = data.aws_iam_policy_document.readonly.json
}

