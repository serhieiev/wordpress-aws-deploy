output "ip" {
  description = "The public IP address of the AWS instance"
  value       = module.vpc.public_eip
}

output "aws_ssh_connection_string" {
  description = "The SSH command to connect to the AWS instance"
  value       = "ssh -i ${var.ssh_priv_key_file} ubuntu@${module.vpc.public_eip}"
}

output "mysql_connection_endpoint" {
  description = "The connection endpoint in address:port format"
  value       = module.rds.endpoint
}