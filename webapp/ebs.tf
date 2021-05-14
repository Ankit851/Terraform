resource "aws_ebs_volume" "example" {
  availability_zone = aws_instance.web.availability_zone
  size              = 1

  tags = {
    Name = "Harddisk Webapp"
  }
}
