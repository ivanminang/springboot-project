## Terraform block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.44.0"
    }
  }
}

provider "aws" {
  region = local.aws_region
}

locals {
  aws_region              = "us-east-2"
  cluster_name            = "dev-me-springboot-control-plane"
  eks_version             = 1.31
  endpoint_private_access = true
  endpoint_public_access  = false
  common_tags = {
    "id"             = "2025"
    "owner"          = "me"
    "environment"    = "dev"
    "project"        = "springboot"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
    "company"        = "DEL"
  }
  public_subnets = {
    us-east-2a = "subnet-0c7ccfec32929fcc3"
    us-east-2b = "subnet-0e14204584807613e"
    us-east-2c = "subnet-09cd14f8fa45b0583"
  }
}
module "EKS" {
  source                  = "../../modules/EKS-control-plane"
  aws_region              = local.aws_region
  common_tags             = local.common_tags
  cluster_name            = local.cluster_name
  eks_version             = local.eks_version
  public_subnets          = values(local.public_subnets)
  endpoint_private_access = local.endpoint_private_access
  endpoint_public_access  = local.endpoint_public_access
}