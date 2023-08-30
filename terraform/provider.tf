terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "terraform-state-nadin"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock-nadin"
    profile        = "fiap"

  }
}

provider "aws" {
  region = var.aws_region
  shared_config_files      = ["./.aws/config"]
  shared_credentials_files = ["./.aws/credentials"]
  profile                  = "fiap"
}
