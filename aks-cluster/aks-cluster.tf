resource "azurerm_resource_group" "default" {
  name     = "${var.projectPrefix}-rg"
  location = var.aks_region

  tags = {
    environment = "Demo"
  }
}

resource "azurerm_kubernetes_cluster" "default" {
  name                = "${var.projectPrefix}-aks"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  dns_prefix          = "${var.projectPrefix}-k8s"

  default_node_pool {
    name            = "default"
    node_count      = var.aks_num_nodes
#    vm_size         = "Standard_DC4s_v2"  # 4 vcpu, 16 GB
#    vm_size         = "Standard_DC2s_v2"  # 2 vcpu, 8 GB
    vm_size         = "Standard_D3_v2"  # 4 vcpu, 14 GB
    os_disk_size_gb = 30
#    enable_node_public_ip = true
  }

  identity {
    type = "SystemAssigned"
  }


  #role_based_access_control {
  #  enabled = true
  #}

  tags = {
    environment = "demo"
  }
}
