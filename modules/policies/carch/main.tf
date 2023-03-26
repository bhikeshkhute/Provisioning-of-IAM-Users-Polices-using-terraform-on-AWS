provider "aws" {
  region = "ap-south-1"
}

#-----------------------------------------------
# GENERATE AN IAM POLICY DOCUMENT IN JSON FORMAT
#-----------------------------------------------
data "aws_iam_policy_document" "fullaccess" {
  #- Read Only Access -#
  statement {
    effect    = "Allow"
    actions   = ["*"]
    resources = ["*"]
  }
}

# -------------------
# CREATE A IAM POLICY
# -------------------
resource "aws_iam_policy" "fullacess" {
  name = "full"
  path = "/"
  policy = data.aws_iam_policy_document.fullaccess.json
  tags = {
    Creator = "terraform"
  }
}

