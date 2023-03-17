# The VPC
resource "aws_vpc" "drupal" {
  cidr_block           = "10.84.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "Drupal VPC"
  }
}

# Subnets on this VPC (one per region)
resource "aws_subnet" "drupal_a" {
  vpc_id                  = aws_vpc.drupal.id
  cidr_block              = "10.84.0.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "Drupal subnet A"
  }
}
resource "aws_subnet" "drupal_b" {
  vpc_id                  = aws_vpc.drupal.id
  cidr_block              = "10.84.1.0/24"
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "Drupal subnet B"
  }
}

# The router for the VPC
resource "aws_internet_gateway" "drupal" {
  vpc_id = aws_vpc.drupal.id
  tags = {
    Name = "Drupal gateway"
  }
}

# Routing Table
resource "aws_route_table" "drupal" {
  vpc_id = aws_vpc.drupal.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.drupal.id
  }
  tags = {
    Name = "Drupal routing table"
  }
}

# Route associations (one per region) for the table
resource "aws_route_table_association" "drupal_a" {
  subnet_id      = aws_subnet.drupal_a.id
  route_table_id = aws_route_table.drupal.id
}

resource "aws_route_table_association" "drupal_b" {
  subnet_id      = aws_subnet.drupal_b.id
  route_table_id = aws_route_table.drupal.id
}
