resource "aws_sagemaker_domain" "mlflow_demo" {
  domain_name = "mlflow-demo"
  auth_mode   = "IAM"
  vpc_id      = data.aws_vpc.default.id
  subnet_ids  = [data.aws_subnet.default_az1.id,data.aws_subnet.default_az2.id,data.aws_subnet.default_az3.id]

  default_user_settings {
    execution_role = aws_iam_role.sagemaker_role.arn
  }
}

