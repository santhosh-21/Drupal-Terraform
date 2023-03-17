# The EC2 instance
output "EC2_IP_address" {
  value = aws_instance.drupal.public_ip
}

output "EC2_DNS_name" {
  value = aws_instance.drupal.public_dns
}

# The RDS instance
output "db_instance_id" {
  value = aws_db_instance.drupal.id
}
output "db_instance_address" {
  value = aws_db_instance.drupal.address
}
