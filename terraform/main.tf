terraform {
  required_version = ">= 1.12.2"
  required_providers {
    aws = {
      source        = "hashicorp/aws"
      version       = ">= 6.0.0"
    }
  }
  backend "s3" {
    bucket          = "turelit-mlflow-demo"
    key             = "terraform/state"
    region          = "eu-north-1"
    use_lockfile    = true
    encrypt         = true
  }
}

provider "aws" {
  region            = "eu-north-1"
}

