output "aws_sagemaker_domain_arn" {
  value       = aws_sagemaker_domain.mlflow_demo.arn
  description = "ARN of the new Sasgemaker domain"
}