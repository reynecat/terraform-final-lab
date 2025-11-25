output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "alb_dns_name" {
  description = "Application Load Balancer DNS Name"
  value       = aws_lb.main.dns_name
}

output "alb_arn" {
  description = "Application Load Balancer ARN"
  value       = aws_lb.main.arn
}

output "target_group_arn" {
  description = "Target Group ARN"
  value       = aws_lb_target_group.main.arn
}

output "asg_name" {
  description = "Auto Scaling Group Name"
  value       = aws_autoscaling_group.main.name
}

output "asg_min_size" {
  description = "ASG Minimum Size"
  value       = aws_autoscaling_group.main.min_size
}

output "asg_max_size" {
  description = "ASG Maximum Size"
  value       = aws_autoscaling_group.main.max_size
}

output "asg_desired_capacity" {
  description = "ASG Desired Capacity"
  value       = aws_autoscaling_group.main.desired_capacity
}

output "rds_endpoint" {
  description = "RDS Database Endpoint"
  value       = aws_db_instance.main.endpoint
}

output "rds_database_name" {
  description = "RDS Database Name"
  value       = aws_db_instance.main.db_name
}

output "rds_connection_string" {
  description = "RDS Connection String"
  value       = "mysql -h ${aws_db_instance.main.endpoint} -u ${var.db_username} -p"
  sensitive   = true
}

output "web_application_url" {
  description = "Web Application URL via ALB"
  value       = "http://${aws_lb.main.dns_name}"
}

output "launch_template_id" {
  description = "Launch Template ID"
  value       = aws_launch_template.main.id
}

output "security_group_alb_id" {
  description = "ALB Security Group ID"
  value       = aws_security_group.alb.id
}

output "security_group_web_id" {
  description = "Web Security Group ID"
  value       = aws_security_group.web.id
}

output "security_group_db_id" {
  description = "Database Security Group ID"
  value       = aws_security_group.db.id
}