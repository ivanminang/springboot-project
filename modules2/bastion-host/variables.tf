# Define string variables
variable "aws_region" {
  type        = string
  description = "AWS region for resources"
  default     = "us-east-2"
}

variable "ec2_instance_ami" {
  type        = string
  description = "AMI ID for the EC2 instance"
  default     = "ami-0fc5d935ebf8bc3bc"
}

variable "key_name" {
  type        = string
  description = "key name of key pair"
  default     = "springboot-key"
}

variable "ec2_instance_type" {
  type        = string
  description = "Instance type for the EC2 instance"
  default     = "t2.micro"
}

# variable "vpc_id" {}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
  default     = "vpc-0b6bd539eefe37c24"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for the EC2 instance"
  default     = "subnet-0532d2d736c5a4cf4"
}

variable "root_volume_size" {
  type        = number
  description = "Size of the root volume for the EC2 instance"
  default     = 10
}

variable "instance_count" {
  type    = number
  default = 1
}

variable "instance_name" {
  type    = string
  default = "bastion-host"
}

variable "sg_name" {
  type    = string
  default = "bastion-sg"
}

variable "ec2_instance_key_name" {
  type    = string
  default = "springboot-key"
}

variable "enable_termination_protection" {
  type    = bool
  default = false
}

variable "allowed_ports" {
  description = "List of allowed ports"
  type        = list(number)
  default = [
    22,
    80,
    8080
  ]
}

variable "tags" {
  type        = map(string)
  description = "Common tags to be applied to resources"
  default = {
    "id"             = "2025"
    "owner"          = "EIM"
    "environment"    = "prod"
    "project"        = "springboot"
    "cloud_provider" = "aws"
  }
}

