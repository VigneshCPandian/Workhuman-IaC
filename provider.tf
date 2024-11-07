provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "workhuman-iac-tf-state-bucket"
    key            = "project/${var.environment}/terraform.tfstate"  # Environment-specific key
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}
