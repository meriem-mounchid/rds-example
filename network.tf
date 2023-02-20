resource "aws_subnet" "private_1" {
  cidr_block = "172.31.32.0/20"
  vpc_id = "vpc-0a163ed0bdd23126e"
  availability_zone = "eu-west-1a"
}

resource "aws_subnet" "private_2" {
  cidr_block = "172.31.48.0/20"
  vpc_id = "vpc-0a163ed0bdd23126e"
  availability_zone = "eu-west-1b"
}

resource "aws_security_group" "my_rds_sg" {
  name_prefix = "my_rds_sg"
  description = "Testing rds sg"
  vpc_id = "vpc-0a163ed0bdd23126e"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "rds-db"
  }
}

resource "aws_security_group" "instance_sg_rds" {
 name        = "instance_sg_rds"
 description = "Testing instance_sg"
 vpc_id = "vpc-0a163ed0bdd23126e"

 ingress {
   from_port   = 3306
   to_port     = 3306
   protocol    = "tcp"
   security_groups = [aws_security_group.my_rds_sg.id]
 }
 egress {
   protocol    = -1
   from_port   = 0
   to_port     = 0
   cidr_blocks = ["0.0.0.0/0"]
 }
}