data "aws_subnet" "sub_pub1" {
  filter {
    name   = "tag:Name"
    values = ["2025-prod-springboot-public-subnet-1-us-east-2a"]
  }
}

data "aws_subnet" "sub_pub2" {
  filter {
    name   = "tag:Name"
    values = ["2025-prod-springboot-public-subnet-2-us-east-2b"]
  }
}

data "aws_subnet" "sub_pub3" {
  filter {
    name   = "tag:Name"
    values = ["2025-prod-springboot-public-subnet-3-us-east-2c"]
  }
}