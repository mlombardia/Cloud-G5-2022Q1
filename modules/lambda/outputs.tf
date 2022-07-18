output "invoke_arn" {
  description = "Invoke ARN for API GW"
  value       = aws_lambda_function.this.invoke_arn
}

output "arn" {
  description = "ARN of Lambda"
  value = aws_lambda_function.this.arn
}

output "id" {
  description = "ID of Lambda"
  value = aws_lambda_function.this.id
}