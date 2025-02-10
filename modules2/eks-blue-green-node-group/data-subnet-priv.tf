data "aws_subnet" "sub_priv1" {
  filter {
    name   = "tag:Name"
    values = ["2025-prod-springboot-private-subnet-1-us-east-2a"]
  }
}

data "aws_subnet" "sub_priv2" {
  filter {
    name   = "tag:Name"
    values = ["2025-prod-springboot-private-subnet-2-us-east-2b"]
  }
}

data "aws_subnet" "sub_priv3" {
  filter {
    name   = "tag:Name"
    values = ["2025-prod-springboot-private-subnet-3-us-east-2c"]
  }
}