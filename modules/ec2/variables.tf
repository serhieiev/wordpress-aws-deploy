variable "ssh_pub_key_file" {
  description = "The path to the public SSH key associated with the local user account"
  type        = string
}

variable "ssh_priv_key_file" {
  description = "The path to the private SSH key associated with the local user account"
  type        = string
}

variable "allocation_id" {
  description = "The allocation ID required for EC2-VPC"
  type        = string
  default     = null
}
variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
  type        = string
  default     = null
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
  default     = null
}