resource "aws_iam_role" "sagemaker_role" {
  name               = "sagemaker_role"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.sagemaker_policy.json
}

data "aws_iam_policy_document" "sagemaker_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["sagemaker.amazonaws.com"]
    }
  }
}