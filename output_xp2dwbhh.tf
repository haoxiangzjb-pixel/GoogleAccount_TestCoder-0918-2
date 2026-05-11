output "public_ip" {
  description = "Dirección IP pública del recurso"
  value       = aws_instance.example.public_ip
}
