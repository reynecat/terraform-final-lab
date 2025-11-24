output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "rds_endpoint" {
  description = "RDS Database Endpoint"
  value       = aws_db_instance.main.endpoint
}

output "rds_connection_string" {
  description = "RDS Connection String"
  value       = "mysql -h ${aws_db_instance.main.endpoint} -u ${var.db_username} -p"
  sensitive   = true
}

output "web_url" {
  description = "Web Application URL"
  value       = "http://${aws_eip.web.public_ip}"
}
