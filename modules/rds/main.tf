# Create an RDS Database Instance
resource "aws_db_instance" "db" {
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t3.micro"
  allocated_storage      = 10
  db_name                = "wpdb"
  username               = var.username
  password               = var.password
  skip_final_snapshot    = true
  db_subnet_group_name   = var.db_subnet_group_name
  vpc_security_group_ids = var.vpc_security_group_ids

  tags = {
    Name = "MYSQL-DB"
  }
}