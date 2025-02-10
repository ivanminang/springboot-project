data "aws_eks_cluster_auth" "eks" {
  name = "2025-prod-springboot"
}

data "aws_eks_cluster" "eks" {
  name = "2025-prod-springboot"
}
data "tls_certificate" "openid" {
  url = data.aws_eks_cluster.eks.identity.0.oidc.0.issuer
}