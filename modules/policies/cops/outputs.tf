output "policy" {
  value       = aws_iam_policy.readonly.policy
  description = "`policy` exported from `aws_iam_policy`"
}

