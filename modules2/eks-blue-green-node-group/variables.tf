variable "aws_region" {
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

variable "eks_version" {
  type    = string
  default = "1.31"
}

variable "node_min" {
  type    = string
  default = "1"
}

variable "desired_node" {
  type    = string
  default = "1"
}

variable "node_max" {
  type    = string
  default = "6"
}

variable "blue_node_color" {
  type    = string
  default = "blue"
}

variable "green_node_color" {
  type    = string
  default = "green"
}

variable "blue" {
  type    = bool
  default = false
}

variable "green" {
  type    = bool
  default = false
}

variable "ec2_ssh_key" {
  type        = string
  description = "SSH key to connect to the node from bastion host"
  default     = "springboot-key"
}

variable "deployment_nodegroup" {
  type    = string
  default = "blue_green"
}

variable "capacity_type" {
  type        = string
  description = "Valid values: ON_DEMAND, SPOT"
  default     = "ON_DEMAND"
}

variable "ami_type" {
  type        = string
  description = "Valid values: AL2_x86_64, AL2_x86_64_GPU, AL2_ARM_64"
  default     = "AL2_x86_64"
}

variable "instance_types" {
  type        = string
  description = "t3.medium should be used at least"
  default     = "t3.medium"
}

variable "disk_size" {
  type    = string
  default = "10"
}


variable "shared_owned" {
  type        = string
  description = "Valid values are shared or owned"
  default     = "shared"
}

variable "enable_cluster_autoscaler" {
  type        = string
  description = "Valid values are true or false"
  default     = "true"
}

variable "control_plane_name" {
  type    = string
  default = "2025-prod-springboot"
}

variable "cluster_name" {
  type    = string
  default = "2025-prod-springboot"
}

# variable "private_subnets" {
#   type = map(string)
# }
