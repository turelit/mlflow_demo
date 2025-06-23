resource "aws_iam_role" "sagemaker_role" {
  name                  = "sagemaker_role"
  path                  = "/"
  assume_role_policy    = data.aws_iam_policy_document.sagemaker_assume_policy_document.json
  inline_policy {
    name            = "sagemaker_role_inline_policy"
    policy          = data.aws_iam_policy_document.sagemaker_inline_policy_document.json
  }
}

data "aws_iam_policy_document" "sagemaker_inline_policy_document" {
  statement {
    actions   = [
        "sagemaker:*",
        "sagemaker-mlflow:*"

    ]
    resources = ["*"]
  }
  statement {
    actions   = [
        "iam:PassRole"
    ]
    resources = ["arn:aws:iam::*:role/sagemaker_role"]
  }
  statement {
    actions   = [
        "s3:*"
    ]
    resources = [
      "${aws_s3_bucket.dev_bucket.arn}",
      "${aws_s3_bucket.dev_bucket.arn}/*"
      ]
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