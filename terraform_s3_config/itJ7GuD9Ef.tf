# Terraform configuration to create an AWS S3 bucket
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
  region = "us-west-2"
}

# Create an S3 bucket
resource "aws_s3_bucket" "example_bucket" {
  bucket = "my-unique-example-bucket-${random_string.bucket_suffix.result}"

  tags = {
    Name        = "ExampleBucket"
    Environment = "Dev"
  }
}

# Generate a random string for bucket name suffix
resource "random_string" "bucket_suffix" {
  length  = 8
  special = false
  upper   = false
}

# Block public access to the bucket
resource "aws_s3_bucket_public_access_block" "example_bucket_block" {
  bucket = aws_s3_bucket.example_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}