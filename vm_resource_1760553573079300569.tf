# Terraform configuration for a virtual machine

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

# Variable definitions
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "AMI ID for the instance"
  type        = string
  default     = "ami-0c02fb55956c7d316"  # Amazon Linux 2 AMI
}

# Virtual Machine Resource (AWS EC2 Instance)
resource "aws_instance" "vm" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "terraform-vm"
  }
}

# Output the public IP of the instance
output "instance_public_ip" {
  description = "Public IP address of the instance"
  value       = aws_instance.vm.public_ip
}