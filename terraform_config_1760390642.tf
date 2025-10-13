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
  bucket = "my-unique-tf-state-bucket-${random_string.suffix.result}" # Use a random suffix for uniqueness
}

# Generate a random string for the bucket name
resource "random_string" "suffix" {
  length  = 8
  special = false
  upper   = false
}

# Enable versioning on the S3 bucket (optional)
resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.my_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}