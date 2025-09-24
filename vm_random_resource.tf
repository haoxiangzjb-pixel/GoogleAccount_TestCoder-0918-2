resource "random_id" "vm_id" {
  byte_length = 4
}

resource "tls_private_key" "vm_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "private_key_pem" {
  content  = tls_private_key.vm_key.private_key_pem
  filename = "vm_key_${random_id.vm_id.hex}.pem"
}

output "private_key_path" {
  value = local_file.private_key_pem.filename
}