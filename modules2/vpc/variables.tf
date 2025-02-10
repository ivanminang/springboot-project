variable "region" {
  type = string
}

variable "availability_zones" {
  type = list(any)
}

variable "cidr_block" {
  type        = string
  description = "VPC cidr block. Example: 10.0.0.0/16"
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

variable "cluster_name" {
  type    = string
  default = "2025-prod-springboot"
}
