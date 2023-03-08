terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.57.0"
    }
  }

  // This is the required version of Terraform
  required_version = "~> 1.3.6"
}

provider "aws" {
  region = var.region
}
