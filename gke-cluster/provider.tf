provider "google" {
  project = var.gke_project_id
  region  = var.gke_region
  credentials = file("~/.config/gcloud/application_default_credentials.json")
}

