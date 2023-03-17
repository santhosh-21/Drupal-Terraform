# Credentials are read in through terraform.tfvars (not in git)
# AWS Region
variable "region" {
  default = "ap-south-1"
}

# Size of the instance
variable "instance_type" {
  default = "t2.micro"
}

# SSH key to deploy
variable "key_name" {
  description = "Key pair to use"
  default     = "aws_ec2"
}

# Whitelist your IP for SSH access here
variable "ip_whitelist" {
  description = "Whitelisted IP for SSH access"
  default     = "0.0.0.0/0"
}
