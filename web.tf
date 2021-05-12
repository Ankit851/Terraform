provider "aws" {
  region     = "ap-south-1"
  profile    = "default"
}

resource "aws_instance" "web" {
  ami           = "ami-010aff33ed5991201"
  instance_type = "t2.micro"
  security_groups = [ "webapp sg" ]
  key_name= "testing"

  tags = {
    Name = "HelloWorld"
  }
}

resource "null_resource" "nullremote1" {


connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("C:/Users/Lenovo/Downloads/testing.pem")
    host     = aws_instance.web.public_ip
  }

provisioner "remote-exec" {
    inline = [
      "sudo yum  install httpd  -y",
      "sudo  yum  install php  -y",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd"
    ]
  }

}

resource "aws_ebs_volume" "example" {
  availability_zone = aws_instance.web.availability_zone
  size              = 1

  tags = {
    Name = "Harddisk Webapp"
  }
}


resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.example.id
  instance_id = aws_instance.web.id
  force_detach = true
}


resource "null_resource"  "nullremote2" {



connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("C:/Users/Lenovo/Downloads/testing.pem")
    host     = aws_instance.web.public_ip
  }

provisioner "remote-exec" {
    inline = [
      "sudo mkfs.ext4 /dev/xvdh",
      "sudo  mount /dev/xvdh  /var/www/html",
    ]
  }

}

resource "null_resource"  "nullremote9" {



connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("C:/Users/Lenovo/Downloads/testing.pem")
    host     = aws_instance.web.public_ip
  }

provisioner "remote-exec" {
    inline = [
      "sudo yum install git -y",
      "sudo git clone https://github.com/Ankit851/Ansible.git   /var/www/html/web",
      "sudo systemctl restart httpd"
    ]
  }

}

resource "null_resource"  "nullremote10" {



provisioner "local-exec" {
   command = "start chrome http://13.233.59.125/web/index.php"
  }

}




