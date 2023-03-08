terraform {
  backend "s3" {
    bucket         = "tf-backend-serhieiev"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "tf-state-lock"
  }
}
