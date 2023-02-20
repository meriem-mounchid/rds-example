
resource "aws_instance" "rds_server_1" {
  ami       = "ami-00463ddd1036a8eb6"
  key_name  = "cert"
  instance_type = "t2.micro"
  subnet_id     = "subnet-0aba2566aa6f9da42"
  vpc_security_group_ids = [aws_security_group.my_rds_sg.id]
  #user_data = file("script.sh")
  user_data = templatefile("${path.module}/templates/instance.tpl",{
    db_endpoint = aws_db_instance.rds-db.endpoint
  })
  tags = {
    Name = "rds_server"
  }
}

#data "template_file" "mydata"{
#  template = "${file("./templates/instance.tpl")}"
#  vars = {
#    var1 = "Hello"
#  }
#}