resource "aws_db_subnet_group" "rds-subnet" {
  name        = "rds-subnet-group"
  description = "Subnet group for RDS instance"
  subnet_ids  = [aws_subnet.private_1.id, aws_subnet.private_2.id]

  tags = {
    Name = "rds-subnet"
  }
}

resource "aws_db_instance" "rds-db" {
  identifier           = "rds-db"
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mariadb"
  engine_version       = "10.6.10"
  instance_class       = "db.t2.micro"
  username             = "myuser"
  password             = "mypassword"
  parameter_group_name = "default.mariadb10.6"
  skip_final_snapshot  = true

  vpc_security_group_ids = [aws_security_group.instance_sg_rds.id]
  db_subnet_group_name   = aws_db_subnet_group.rds-subnet.name

  tags = {
    Name = "rds-db"
  }
}