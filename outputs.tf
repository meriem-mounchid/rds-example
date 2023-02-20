output "instance_ip" {
  value = aws_instance.rds_server_1.public_ip
}

output "rds-name" {
  value = aws_db_instance.rds-db.name
}
output "rds_endpoint" {
  value = aws_db_instance.rds-db.endpoint
}

output "rds_port" {
  value = aws_db_instance.rds-db.port
}