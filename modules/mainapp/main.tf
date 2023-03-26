# ----------------------------
# CONFIGURE OUR AWS CONNECTION
# ----------------------------
provider "aws" {
  region = "ap-south-1"
}

module "carch" {
  source = "../policies/carch"
}

module "cdev" {
  source = "../policies/cdev"
}

module "cops" {
  source = "../policies/cops"
}

# ---------------
# CREATE IAM USER
# ---------------
resource "aws_iam_user" "demo" {
  name = var.name
  path = "/"
}

resource "aws_iam_user_login_profile" "administrator" {
  user                    = aws_iam_user.demo.name
  password_reset_required = true
}

output "password" {
  value     = aws_iam_user_login_profile.administrator.password
  sensitive = true
}


# -------------------------
# ATTACH POLICY TO THE USER
# -------------------------

resource "aws_iam_user_policy" "mypol" {
  name = var.policytype
  user   = aws_iam_user.demo.name
  policy = var.carch ? module.carch.policy : (var.cdev ? module.cdev.policy : module.cops.policy)
}

