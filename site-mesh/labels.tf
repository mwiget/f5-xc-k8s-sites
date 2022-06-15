resource "volterra_modify_site" "eks" {
  name = "${var.projectPrefix}-eks"
  namespace = "system"
  labels = {
    site-group = var.projectPrefix
  }
}

resource "volterra_modify_site" "aks" {
  name = "${var.projectPrefix}-aks"
  namespace = "system"
  labels = {
    site-group = var.projectPrefix
  }
}

resource "volterra_modify_site" "gke" {
  name = "${var.projectPrefix}-gke"
  namespace = "system"
  labels = {
    site-group = var.projectPrefix
  }
}

