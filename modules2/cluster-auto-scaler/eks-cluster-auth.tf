provider "kubernetes" {
  host                   = data.aws_eks_cluster.springboot.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.springboot.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.springboot.token
}
