variable "name_spaces" {
  type = list(string)
}


variable "tags" {
  type = map(any)
  default = {
    "id"             = "2025"
    "owner"          = "DEIM"
    "environment"    = "prod"
    "project"        = "springboot"
    "cloud_provider" = "aws"
  }
}

variable "region" {
  type    = string
  default = "us-east-2"
}

variable "control_plane_name" {
  type    = string
  default = "2025-prod-springboot"
}
