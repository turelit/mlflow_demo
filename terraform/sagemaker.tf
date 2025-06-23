resource "aws_sagemaker_domain" "mlflow_demo" {
  domain_name = "mlflow-demo"
  auth_mode   = "IAM"
  vpc_id      = data.aws_vpc.default.id
  subnet_ids  = [data.aws_subnet.default_az1.id,data.aws_subnet.default_az2.id,data.aws_subnet.default_az3.id]

  default_user_settings {
    execution_role = aws_iam_role.sagemaker_role.arn
  }
  default_space_settings {
    execution_role = aws_iam_role.sagemaker_role.arn
    jupyter_server_app_settings {
      code_repository {
        repository_url = aws_sagemaker_code_repository.mlflow_demo_repository.id
      }
      default_resource_spec {
        instance_type = "ml.t3.medium"
      }
    }
  }
}

resource "aws_sagemaker_user_profile" "turelit" {
  domain_id             = aws_sagemaker_domain.mlflow_demo.id
  user_profile_name     = "turelit"
}

resource "aws_sagemaker_code_repository" "mlflow_demo_repository" {
  code_repository_name = "my-notebook-instance-code-repo"

  git_config {
    repository_url = "https://github.com/turelit/mlflow_demo.git"
  }
}

resource "aws_sagemaker_space" "mlflow_demo_space" {
  domain_id  = aws_sagemaker_domain.mlflow_demo.id
  space_name = "mlflow-demo-space"
}

#resource "aws_sagemaker_mlflow_tracking_server" "mlflow_tracking_server" {
#  tracking_server_name = "mlflow-demo-tracking-server"
#  role_arn             = aws_iam_role.sagemaker_role.arn
#  artifact_store_uri   = "s3://${aws_s3_bucket.dev_bucket.bucket}"
#}