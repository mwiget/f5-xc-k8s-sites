resource "volterra_virtual_site" "vs" {
  name        = "${var.projectPrefix}-site-mesh"
  namespace = "shared"
  site_type = "CUSTOMER_EDGE"
  site_selector {
    expressions = [ "site-group in (${var.projectPrefix})" ]
  }
}

resource "volterra_site_mesh_group" "smg" {
  name        = format("%s-site-mesh", var.projectPrefix)
  namespace   = "system"
  type        = "SITE_MESH_GROUP_TYPE_FULL_MESH"
  tunnel_type = "SITE_TO_SITE_TUNNEL_IPSEC"
  virtual_site {
  name        = "${var.projectPrefix}-site-mesh"
    namespace = "shared"
  }
   depends_on = [volterra_virtual_site.vs]
}
