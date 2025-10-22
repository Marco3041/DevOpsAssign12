# ----------------------------
# Terraform Variables
# ----------------------------

variable "aws_region" {
  description = "AWS region to deploy"
  type        = string
  default     = "us-east-1"
}

variable "aws_region_az" {
  description = "AWS availability zone"
  type        = string
  default     = "us-east-1a"
}

variable "aws_access_key" {
  description = "AWS Access Key"
  type        = string
  default     = "YOUR_AWS_ACCESS_KEY"
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
  type        = string
  default     = "YOUR_AWS_SECRET_KEY"
}

variable "key_name" {
  description = "AWS key pair name"
  type        = string
  default     = "devops_key"
}

variable "public_key_path" {
  description = "Path to public key file"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "ami_id" {
  description = "AMI ID for EC2 instances (e.g., Ubuntu 22.04 LTS)"
  type        = string
  default     = "ami-0c02fb55956c7d316"
}
