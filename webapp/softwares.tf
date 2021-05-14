resource "null_resource" "nullremote1" {

depends_on = [
    aws_instance.web,
  ]




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
