variable "instance_type" {
  description = "The type of EC2 instance to launch"
  type        = string
  default     = "t3.micro"
  
  validation {
    condition     = length(var.instance_type) > 0
    error_message = "Instance type must not be empty."
  }
}