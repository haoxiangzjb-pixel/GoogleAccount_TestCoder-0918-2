# Terraform configuration for a virtual machine

resource "azurerm_virtual_machine" "example_vm" {
  name                  = "example-vm"
  location              = "East US"
  resource_group_name   = "example-rg"
  network_interface_ids = [azurerm_network_interface.example_nic.id]
  vm_size               = "Standard_B2s"

  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}

resource "azurerm_network_interface" "example_nic" {
  name                = "example-nic"
  location            = "East US"
  resource_group_name = "example-rg"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_subnet" "example_subnet" {
  name                 = "example-subnet"
  resource_group_name  = "example-rg"
  virtual_network_name = "example-vnet"
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_virtual_network" "example_vnet" {
  name                = "example-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = "East US"
  resource_group_name = "example-rg"
}