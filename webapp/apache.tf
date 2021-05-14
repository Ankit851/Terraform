resource "null_resource"  "nullremote2" {

depends_on = [
    aws_volume_attachment.ebs_att,
  ]



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
   command = "start chrome http://13.234.119.222/web/index.php"
  }

}



