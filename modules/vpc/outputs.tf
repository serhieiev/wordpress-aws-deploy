output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "wp_private_subnet_id" {
  description = "The ID of the private subnet for the WP instance"
  value       = aws_subnet.public1.id
}

output "wp_security_group_id" {
  description = "The ID of the security group for the WP instance"
  value       = [aws_security_group.instance.id]
}

output "lb_public_subnet_ids" {
  description = "A list of the IDs of the public subnets for the LB"
  value       = [aws_subnet.public1.id, aws_subnet.public2.id]
}

output "lb_security_group_id" {
  description = "The ID of the security group for the LB"
  value       = [aws_security_group.lb.id]
}

output "lb_target_group_arn" {
  description = "The ARN of the target group for the LB"
  value       = aws_lb_target_group.tg.arn
}

output "eip_id" {
  description = "The ID of the Elastic IP address for the WP instance"
  value       = aws_eip.wp_eip.id
}

output "db_subnet_group_name" {
  description = "The name of the custom subnet group for the RDS database"
  value       = aws_db_subnet_group.db_subnet_group.name
}

output "db_security_group_id" {
  description = "The ID of the security group created for the RDS database"
  value       = [aws_security_group.db.id]
}

output "public_eip" {
  description = "The public IP address of the instance"
  value       = aws_eip.wp_eip.public_ip
}



