# resource "null_resource" "cluster-auth-apply" {
#   triggers = {
#     always_run = timestamp()
#   }
#   provisioner "local-exec" {
#     command = "aws eks update-kubeconfig --name ${var.cluster_name} --region ${var.aws_region} --alias ${var.cluster_name}"
#   }
# # depends_on = [ aws_eks_cluster.eks ]
# }