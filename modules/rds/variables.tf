variable "username" {
  description = "Username for the master DB user"
  sensitive = true
  type = string
}

variable "password" {
  description = "Password for the master DB user"
  sensitive = true
  type = string
}

variable "db_subnet_group_name" {
  description = "Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC"
  type        = string
  default     = null
}

variable "vpc_security_group_ids" {
  description = "List of VPC security groups to associate"
  type        = list(string)
  default     = []
}
