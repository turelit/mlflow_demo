output "aws_sagemaker_domain_arn" {
  value       = aws_sagemaker_domain.mlflow_demo.arn
  description = "ARN of the Sasgemaker domain"
}

output "s3_development_bucket_url" {
  value       = aws_s3_bucket.dev_bucket.bucket
  description = "URL of the S3 development bucket for Sagemaker"
}