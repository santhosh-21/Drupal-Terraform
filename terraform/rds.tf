resource "aws_db_instance" "drupal" {
  identifier              = "drupal"
  allocated_storage       = 10
  engine                  = "mysql"
  engine_version          = "5.7"
  instance_class          = "db.t2.micro"
  multi_az                = false
  apply_immediately       = true
  db_name                 = "drupal"
  username                = "drupal"
  password                = "drupalpwd"
  db_subnet_group_name    = aws_db_subnet_group.drupal.name
  parameter_group_name    = "default.mysql5.7"
  backup_retention_period = 0
  vpc_security_group_ids  = ["${aws_security_group.drupal_db.id}"]
  storage_type            = "gp2"
  skip_final_snapshot     = true
}
resource "aws_db_subnet_group" "drupal" {
  name        = "drupal"
  description = "Database subnet group"
  subnet_ids  = ["${aws_subnet.drupal_a.id}", "${aws_subnet.drupal_b.id}"]
}
