resource "aws_iam_role" "sagemaker_role" {
  name                  = "sagemaker_role"
  path                  = "/"
  assume_role_policy    = data.aws_iam_policy_document.sagemaker_assume_policy_document.json
  inline_policy {
    name   = "sagemaker_role_inline_policy"
    policy = data.aws_iam_policy_document.sagemaker_inline_policy_document.json
  }
}

data "aws_iam_policy_document" "sagemaker_inline_policy_document" {
  statement {
    actions   = [
        "sagemaker:DescribeDomain",
        "sagemaker:listSpaces",
        "sagemaker:listApps",
        "sagemaker:describeApp",
    ]
    resources = ["arn:aws:sagemaker*"]
  }
}

data "aws_iam_policy_document" "sagemaker_assume_policy_document" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["sagemaker.amazonaws.com"]
    }
  }
}