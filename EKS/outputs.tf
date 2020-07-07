output "endpoint" {
    value = aws_eks_cluster.syed_cluster.endpoint
}

output "kubeconfig-certificate-authority-data" {
    value = aws_eks_cluster.syed_cluster.certificate_authority.0.data
}

output "cluster_name" {
    value = aws_eks_cluster.syed_cluster.name
}