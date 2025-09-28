# This file configures a virtual machine using the 'example' provider.
# Note: This is a template and will not run without a valid provider configuration.

resource "example_virtual_machine" "vm_instance" {
  name         = "my-vm-instance"
  location     = "us-central1"
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {
      # Allocate a ephemeral external IP.
    }
  }
}