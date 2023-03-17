resource "tls_private_key" "drupal" {
  algorithm = "RSA"
}
resource "aws_key_pair" "drupal" {
  key_name   = "aws_ec2"
  public_key = tls_private_key.drupal.public_key_openssh
}
