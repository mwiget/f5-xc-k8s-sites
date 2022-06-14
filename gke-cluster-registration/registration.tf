resource "volterra_registration_approval" "gke-0" {
  cluster_name  = var.cluster_name
  cluster_size  = 3
  retry = 5
  wait_time = 60
  hostname = "vp-manager-0"
}
resource "volterra_registration_approval" "gke-1" {
  cluster_name  = var.cluster_name
  cluster_size  = 3
  retry = 5
  wait_time = 60
  hostname = "vp-manager-1"
}
resource "volterra_registration_approval" "gke-2" {
  cluster_name  = var.cluster_name
  cluster_size  = 3
  retry = 5
  wait_time = 60
  hostname = "vp-manager-2"
}
