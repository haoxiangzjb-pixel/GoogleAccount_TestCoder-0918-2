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
resource "aws_s3_bucket" "example_bucket" {
  bucket = "my-example-tf-bucket-20251011" # Replace with a globally unique name
}

# Optionally, enable versioning
resource "aws_s3_bucket_versioning" "example_bucket_versioning" {
  bucket = aws_s3_bucket.example_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}