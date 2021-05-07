provider "aws" {
  region     = "ap-south-1"
  profile    = "default"
}

# step: 1  --> Launching ec2 instance

resource "aws_instance" "ankit" {
  ami           = "ami-010aff33ed5991201"
  instance_type = "t2.micro"
 tags ={
    Name= "myos1"
  }

}

# step: 2  --> creating volume

resource "aws_ebs_volume" "example" {
  availability_zone = aws_instance.ankit.availability_zone
  size              = 8

  tags = {
    Name = "HelloWorld"
  }
}

# step: 3 --> attaching ebs to os

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.example.id
  instance_id = aws_instance.ankit.id
}

output "o2" {
    value = aws_instance.ankit.availability_zone
   
}

output "os" {
    value = aws_ebs_volume.example.id

}

output "o3" {
    value = aws_instance.ankit.id

}





