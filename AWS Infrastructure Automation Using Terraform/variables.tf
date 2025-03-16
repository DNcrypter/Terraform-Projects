variable "aws_region" {
  description = "The AWS region to deploy infrastructure"
  type        = string
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "The AWS CLI profile to use"
  type        = string
  default     = "default"
}

variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "db_username" {
  description = "Username for RDS"
  type        = string
}

variable "db_password" {
  description = "Password for RDS"
  type        = string
  sensitive   = true
}

# Additional variables like database name, etc.
