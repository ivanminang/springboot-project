variable "region" {
  type    = string
  default = "us-east-2"
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

variable "cluster-autoscaler-sa" {
  type    = string
  default = "cluster-autoscaler-sa"
}

variable "cluster-autoscaler-ns" {
  type    = string
  default = "cluster-autoscaler"
}

variable "control_plane_name" {
  type    = string
  default = "2025-prod-springboot"
}
