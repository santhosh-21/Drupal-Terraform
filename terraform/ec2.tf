resource "aws_instance" "drupal" {
  # Image
  ami = data.aws_ami.ubuntu.id
  # Size
  instance_type = var.instance_type
  # Apply SSH key
  key_name = var.key_name
  # Firewall rules
  vpc_security_group_ids = ["${aws_security_group.drupal_ec2.id}"]
  # Put this one in availability zone a
  subnet_id = aws_subnet.drupal_a.id
  # Tag
  tags = {
    Name = "Drupal"
  }

  provisioner "file" {
    source      = "../scripts/setup.sh"
    destination = "/tmp/setup.sh"
    connection {
      type        = "ssh"
      user        = "ubuntu"
      host        = self.public_dns
      port        = 22
      agent       = false
      private_key = tls_private_key.drupal.private_key_pem
      timeout     = "5m"
    }
  }
  provisioner "file" {
    source      = "../configs/vhosts.conf"
    destination = "/tmp/vhosts.conf"
    connection {
      type        = "ssh"
      user        = "ubuntu"
      host        = self.public_dns
      port        = 22
      agent       = false
      private_key = tls_private_key.drupal.private_key_pem
      timeout     = "2m"
    }
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/setup.sh",
      "bash /tmp/setup.sh ${aws_db_instance.drupal.username}:drupalpwd@${aws_db_instance.drupal.address}:${aws_db_instance.drupal.port}/${aws_db_instance.drupal.name}"
    ]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      host        = self.public_dns
      port        = 22
      agent       = false
      private_key = tls_private_key.drupal.private_key_pem
      timeout     = "2m"
    }
  }
}
