output "cluster_name" {
  value = aws_eks_cluster.cluster.name
  description = "EKS Cluster Name"
}

output "cluster_arn" {
  value = aws_eks_cluster.cluster.arn
  description = "EKS Cluster's ARN"
}

output "cluster_endpoint" {
  value = aws_eks_cluster.cluster.endpoint
  description = "EKS Cluster's Endpoint"
}

output "cluster_cert_auth" {
  value = aws_eks_cluster.cluster.certificate_authority
  description = "EKS Cert Authority"
}