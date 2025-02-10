## Terraform block
terraform {
  # required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.44.0"
    }
  }
}

locals {
  aws_region         = "us-east-2"
  # control_plane_name = "dev-me-springboot-control-plane"
  cluster_name       = "dev-me-springboot-control-plane"
  role_arn = "arn:aws:iam::211125635870:role/dev-me-springboot-nodegroup-role"
  user_arn =  "arn:aws:iam::211125635870:user/Ivanov-IAM"
  username = "Ivanov-IAM"
  common_tags = {
    "id"             = "2025"
    "owner"          = "me"
    "environment"    = "dev"
    "project"        = "springboot"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
    "company"        = "DEL"
  }
}

module "aws-auth-config" {
  source             = "../../modules/auth-config"
  aws_region         = local.aws_region
  user_arn           = local.user_arn
  username           = local.username
  role_arn           = local.role_arn
  common_tags        = local.common_tags
}
