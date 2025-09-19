# Terraform configuration for creating an AWS S3 bucket
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS provider
provider "aws" {
  region = "us-west-2"
}

# Create an S3 bucket
resource "aws_s3_bucket" "example_bucket" {
  bucket = "my-unique-example-bucket-${random_string.suffix.result}"

  tags = {
    Name        = "ExampleBucket"
    Environment = "Dev"
  }
}

# Generate random string for bucket name uniqueness
resource "random_string" "suffix" {
  length  = 8
  special = false
  upper   = false
}