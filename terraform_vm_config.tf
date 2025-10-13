# Terraform configuration for a Virtual Machine

terraform {
  required_providers {
    # This example uses the 'null' provider for demonstration.
    # Replace with your cloud provider (e.g., aws, azurerm, google).
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
  }
}

# Data source example (optional, for getting information)
data "null_data_source" "vm_info" {
  inputs = {
    name = "my-test-vm"
    cpu  = 2
    ram  = "4GB"
  }
}

# Resource: Virtual Machine (using null_resource as a placeholder)
resource "null_resource" "virtual_machine" {
  # Triggers can be used to force recreation if certain conditions change
  triggers = {
    name = data.null_data_source.vm_info.outputs.name
  }

  # Provisioner example: Executing a local command after creation
  provisioner "local-exec" {
    command = "echo 'Virtual Machine ${data.null_data_source.vm_info.outputs.name} provisioned!' >> terraform_vm.log"
  }
}

# Output example
output "vm_name" {
  value = data.null_data_source.vm_info.outputs.name
}