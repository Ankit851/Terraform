resource "aws_instance" "web" {
  ami           = "ami-010aff33ed5991201"
  instance_type = "t2.micro"
  security_groups = [ "webapp sg" ]
  key_name= "testing"

  tags = {
    Name = "HelloWorld"
  }
}
