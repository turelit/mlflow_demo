resource "aws_sagemaker_domain" "mlflow_demo" {
  domain_name = "mlflow_demo"
  auth_mode   = "IAM"
  vpc_id      = aws_vpc.default.id
  subnet_ids  = [aws_subnet.default.id]

  default_user_settings {
    execution_role = aws_iam_role.example.arn
  }
}

