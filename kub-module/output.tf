output "cluster_name" {
  description = "Name of the Kubernetes cluster"
  value       = module.eks.cluster_id
}

output "cluster_id" {
  description = "ID of the Kubernetes cluster"
  value       = module.eks.cluster_id
}