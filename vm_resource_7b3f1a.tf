/*
This is a Terraform configuration file for a virtual machine.
It defines a resource block for a VM instance.
*/

resource "aws_instance" "web_server" {
  ami           = "ami-0c55b159cbfafe1d0" # Amazon Linux 2 AMI
  instance_type = "t2.micro"

  tags = {
    Name = "WebServer"
  }
}