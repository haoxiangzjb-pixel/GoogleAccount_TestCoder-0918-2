# Terraform configuration for a virtual machine

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "vm_resource_group" {
  name     = "my-vm-resource-group"
  location = "East US"
}

# Create a virtual network
resource "azurerm_virtual_network" "vm_network" {
  name                = "my-vm-virtual-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.vm_resource_group.location
  resource_group_name = azurerm_resource_group.vm_resource_group.name
}

# Create a subnet
resource "azurerm_subnet" "vm_subnet" {
  name                 = "my-vm-subnet"
  resource_group_name  = azurerm_resource_group.vm_resource_group.name
  virtual_network_name = azurerm_virtual_network.vm_network.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Create a network interface
resource "azurerm_network_interface" "vm_nic" {
  name                = "my-vm-network-interface"
  location            = azurerm_resource_group.vm_resource_group.location
  resource_group_name = azurerm_resource_group.vm_resource_group.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.vm_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Create the virtual machine
resource "azurerm_linux_virtual_machine" "vm" {
  name                = "my-vm"
  location            = azurerm_resource_group.vm_resource_group.location
  resource_group_name = azurerm_resource_group.vm_resource_group.name
  size                = "Standard_B1s"
  admin_username      = "adminuser"

  network_interface_ids = [
    azurerm_network_interface.vm_nic.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = var.ssh_public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}

# Define variable for SSH public key
variable "ssh_public_key" {
  description = "SSH public key for the virtual machine"
  type        = string
}