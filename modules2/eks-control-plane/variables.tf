
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


variable "region" {
  type = string
}

variable "eks_version" {
  type = string
}

variable "endpoint_private_access" {
  type = bool
}

variable "endpoint_public_access" {
  type = bool
}

variable "public_subnets" {
  type = map(any)
  default = {
    us-east-1a = ""
    us-east-1b = ""
    us-east-1c = ""
  }
}
