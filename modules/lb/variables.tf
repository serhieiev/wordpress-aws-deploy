variable "subnets" {
  description = "A list of subnet IDs to attach to the LB"
  type        = list(string)
  default     = null
}

variable "security_groups" {
  description = "A list of security group IDs to assign to the LB"
  type        = list(string)
  default     = null
}

variable "vpc_id" {
  description = "VPC id where the load balancer and other resources will be deployed."
  type        = string
  default     = null
}

variable "target_group_arn" {
  description = "The ARN of the target group with which to register targets"
  type        = string
  default     = null
}

variable "target_id" {
  description = "The ID of the target"
  type        = string
  default     = null
}

