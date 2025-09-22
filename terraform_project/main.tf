provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1d0" # Ubuntu 20.04 LTS
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleInstance"
  }
}