resource "aws_db_instance" "default" {
  allocated_storage      = var.db_allocated_storage
  storage_type           = "gp2"
  engine                 = var.db_engine
  engine_version         = var.db_engine_version
  instance_class         = var.db_instance_class
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.default.name 
  skip_final_snapshot    = true
  identifier             = "lb-mariadb-instance"
  tags = {
    Name = "LB-mariadb-instance"
  }
}

resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [for s in aws_subnet.subnet : s.id]

  tags = {
    Name = "LB-DB-subnet-group"
  }
}
