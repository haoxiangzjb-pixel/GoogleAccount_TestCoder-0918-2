# Randomly named Terraform file for a virtual machine resource

resource "aws_instance" "my_vm" {
  ami           = "ami-0c55b159cbfafe1d0" # Amazon Linux 2 AMI
  instance_type = "t2.micro"

  tags = {
    Name = "MyRandomVM"
  }
}