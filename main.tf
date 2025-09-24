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
  region = var.aws_region
}

# Create an S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
}

# Variable for the S3 bucket name
variable "bucket_name" {
  description = "The name of the S3 bucket to create"
  type        = string
}

# Variable for the AWS region
variable "aws_region" {
  description = "The AWS region to deploy the bucket in"
  type        = string
  default     = "us-east-1"
}

# Output the bucket name
output "bucket_name" {
  value = aws_s3_bucket.my_bucket.id
}