resource "aws_db_instance" "default" {
  identifier        = "mydb-instance"
  engine            = "mysql"
  instance_class    = "db.t3.micro"
  allocated_storage = 20
  username          = var.db_username
  password          = var.db_password
  db_name           = "mydb"
  storage_encrypted = true

  tags = {
    Name = "MyDBInstance"
  }

  vpc_security_group_ids = [aws_security_group.db_sg.id]
}

resource "aws_security_group" "db_sg" {
  name        = "db-sg"
  description = "Allow database access"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]  # Restrict DB access to the VPC
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
