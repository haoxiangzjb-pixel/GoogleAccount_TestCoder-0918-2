terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-2" # You can change this to your preferred region
}

# Create an S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-tf-state-bucket-${data.aws_caller_identity.current.account_id}" # Use a unique name, often including account ID or random suffix
}

# Data source to get the current AWS account ID
data "aws_caller_identity" "current" {}