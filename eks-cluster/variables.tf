variable "projectPrefix" {
  type  = string
  default = null
}

variable "eks_region" {}

variable "f5xc_site_token" {
  description = "F5 Distributed Cloud Site Token"
}
