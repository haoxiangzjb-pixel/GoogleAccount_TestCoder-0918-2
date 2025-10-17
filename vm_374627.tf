# Ресурс Terraform для виртуальной машины (AWS EC2 Instance)

# Определение ресурса aws_instance
resource "aws_instance" "example_vm" {
  ami           = "ami-0c55b159cbfafe1d0"  # Amazon Linux 2 AMI (us-east-1, 64-bit x86)
  instance_type = "t2.micro"               # Бесплатный тарифный план

  tags = {
    Name = "ExampleVM"
  }
}