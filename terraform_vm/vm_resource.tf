resource "aws_instance" "web_server" {
  ami           = "ami-0abcdef1234567890" # Amazon Linux 2
  instance_type = "t3.small"
  
  vpc_security_group_ids = ["sg-12345678"]
  key_name               = "my-key-pair"

  tags = {
    Name = "WebServer"
    Environment = "Production"
  }
}