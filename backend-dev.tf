terraform {
  backend "s3" {
    bucket         = "workhuman-iac-tf-state-bucket"
    key            = "project/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}