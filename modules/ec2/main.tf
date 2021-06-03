provider "aws" {
  region                  =  var.region
  profile                 =  var.user
}

resource "aws_instance" "web" {
  ami           = "ami-010aff33ed5991201"
  instance_type = var.type

  tags = {
    Name = "HelloWorld"
  }
}
