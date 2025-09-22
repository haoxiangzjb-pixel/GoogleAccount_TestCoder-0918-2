resource "aws_instance" "example_vm" {
  ami           = "ami-0c55b159cbfafe1d0" # Ubuntu 20.04 LTS
  instance_type = "t2.micro"
  
  tags = {
    Name = "ExampleVM"
  }
}