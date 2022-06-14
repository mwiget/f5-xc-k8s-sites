variable "projectPrefix" {
  type  = string
  default = null
}

variable "aks_num_nodes" {
  description = "Azure Kubernetes node_count"
}

variable "f5xc_site_token" {
  description = "F5 Distributed Cloud Site Token"
}
