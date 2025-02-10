variable "tags" {
  type = map(any)
  default = {
    "id"             = "2025"
    "owner"          = "EIM"
    "environment"    = "prod"
    "project"        = "springboot"
    "cloud_provider" = "aws"
  }
}

variable "region" {
  type    = string
  default = "us-east-2"
}

variable "aws-ebs-csi-driver-sa" {
  type    = string
  default = "aws-ebs-csi-driver-sa"
}

variable "aws-ebs-csi-driver-ns" {
  type    = string
  default = "aws-ebs-csi-driver"
}

variable "control_plane_name" {
  type    = string
  default = "2025-prod-springboot"
}

variable "storage-class-name" {
  type    = string
  default = "prod-storage-class"
}

