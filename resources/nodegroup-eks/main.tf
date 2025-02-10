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
  aws_region   = "us-east-2"
  cluster_name = "dev-me-springboot-control-plane"
  eks_version  = "1.31"
  node_min     = "1"
  desired_node = "1"
  node_max     = "6"

  key_pair                  = "springboot-key"
  deployment_nodegroup      = "blue_green"

  blue_node_color  = "blue"
  green_node_color = "green"

  blue  = false
  green = true
  
  capacity_type             = "ON_DEMAND"
  ami_type                  = "AL2_x86_64"
  instance_types            = "t2.medium"
  disk_size                 = "10"
  shared_owned              = "shared"
  enable_cluster_autoscaler = true

  common_tags = {
    "id"             = "2025"
    "owner"          = "me"
    "environment"    = "dev"
    "project"        = "springboot"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
    "company"        = "DEL"
  }

  private_subnets = {
    us-east-2a = "subnet-08b499d73bb1d427d"
    us-east-2b = "subnet-03e5005a537345a90"
    us-east-2c = "subnet-0f904b5326f2b039d"
  }
}
module "Nodegroup" {
  source                    = "../../modules/nodegroup-eks"
  aws_region                = local.aws_region
  cluster_name              = local.cluster_name
  eks_version               = local.eks_version
  node_min                  = local.node_min
  desired_node              = local.desired_node
  node_max                  = local.node_max
  private_subnets          = values(local.private_subnets)
  key_pair                  = local.key_pair
  deployment_nodegroup      = local.deployment_nodegroup
  blue_node_color           = local.blue_node_color
  capacity_type             = local.capacity_type
  ami_type                  = local.ami_type
  instance_types            = local.instance_types
  disk_size                 = local.disk_size
  shared_owned              = local.shared_owned
  enable_cluster_autoscaler = local.enable_cluster_autoscaler
  common_tags               = local.common_tags
}