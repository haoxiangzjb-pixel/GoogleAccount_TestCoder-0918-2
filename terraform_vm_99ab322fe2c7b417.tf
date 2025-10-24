# Terraform configuration for a virtual machine

terraform {
  required_providers {
    # Example provider - in real usage you would specify your cloud provider
    # such as aws, azurerm, google, etc.
  }
}

# Example virtual machine resource (using a generic format)
# Note: The actual provider and resource type would depend on your cloud platform
resource "aws_instance" "example_vm" {
  ami           = "ami-0c55b159cbfafe1d0"  # Amazon Linux 2 AMI (us-east-1)
  instance_type = "t2.micro"
  
  tags = {
    Name = "example-vm"
  }
}

# Alternative example for Azure
/*
resource "azurerm_virtual_machine" "example_vm" {
  name                  = "example-vm"
  location              = "East US"
  resource_group_name   = "example-rg"
  vm_size               = "Standard_B1s"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_profile {
    computer_name  = "example-vm"
    admin_username = "adminuser"
    admin_password = "Password123!"
  }
}
*/

# Output the VM's public IP
output "vm_public_ip" {
  value = aws_instance.example_vm.public_ip
}