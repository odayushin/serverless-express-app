terraform {
  required_version = ">= 0.12.0"
  backend "s3" {
    bucket = "manage-terraform-state-oda"
    region = "ap-northeast-1"
    key = "serverless-express-app.tfstate"
    encrypt = true
  }
  required_providers {
    aws = "~> 3.0"
  }
}