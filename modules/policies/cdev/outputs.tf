output "policy" {
  value       = aws_iam_policy.writeonly.policy
  description = "`policy` exported from `aws_iam_policy`"
}

