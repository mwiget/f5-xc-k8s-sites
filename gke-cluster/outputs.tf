output "region" {
  value       = var.gke_region
  description = "GCloud Region"
}

output "project_id" {
  value       = var.gke_project_id
  description = "GCloud Project ID"
}

output "kubernetes_cluster_name" {
  value       = google_container_cluster.primary.name
  description = "GKE Cluster Name"
}

output "kubernetes_cluster_host" {
  value       = google_container_cluster.primary.endpoint
  description = "GKE Cluster Host"
}

output "f5xc_site_token" {
  value       = var.f5xc_site_token
  description = "F5XC registration site token"
}
