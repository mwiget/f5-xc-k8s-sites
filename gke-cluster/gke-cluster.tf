variable "gke_username" {
  default     = ""
  description = "gke username"
}

variable "gke_password" {
  default     = ""
  description = "gke password"
}

variable "gke_num_nodes" {
  # In regional or multi-zonal clusters, this is the number of nodes per zone.
  default     = 2
  description = "number of gke nodes"
}

# GKE cluster
resource "google_container_cluster" "primary" {
  name     = "${var.projectPrefix}-gke"
  location = var.gke_region
  
  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name
}

# Separately Managed Node Pool
resource "google_container_node_pool" "primary_nodes" {
  name         = "${google_container_cluster.primary.name}-node-pool"
  location     = var.gke_region
  cluster      = google_container_cluster.primary.name
  node_count   = var.gke_num_nodes

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels = {
      env = var.gke_project_id
    }

    # preemptible  = true
    machine_type = "e2-standard-4"    # 4 cores, 16 GB RAM
    tags         = ["gke-node", "${var.gke_project_id}-gke"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}
