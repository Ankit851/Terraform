provider "aws" {

region = "ap-south-1"
access_key = "your Access Key"
secret_key = "Your Secret Key"

}

resource "aws_instance" "web" {
  ami           = "ami-010aff33ed5991201"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_instance" "map" {
  ami           = "ami-010aff33ed5991201"
  instance_type = "t2.micro"

  tags = {
    Name = "First Os"
  }
}
