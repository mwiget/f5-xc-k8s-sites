resource "random_pet" "prefix" {}

resource "azurerm_resource_group" "default" {
  name     = "${random_pet.prefix.id}-rg"
  location = "West US 2"

  tags = {
    environment = "Demo"
  }
}

resource "azurerm_kubernetes_cluster" "default" {
  name                = "${random_pet.prefix.id}-aks"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  dns_prefix          = "${random_pet.prefix.id}-k8s"

  default_node_pool {
    name            = "default"
    node_count      = var.aks_num_nodes
#    vm_size         = "Standard_D4_v5"   # 4 vcpu 16 GB, not working for me
#    vm_size         = "Standard_DC4s_v2"  # 4 vcpu, 16 GB
#    vm_size         = "Standard_DC2s_v2"  # 2 vcpu, 8 GB
    vm_size         = "Standard_D3_v2"  # 4 vcpu, 14 GB
    os_disk_size_gb = 30
  }

  #service_principal {
  #  client_id     = var.aks_appId
  #  client_secret = var.aks_password
  #}

  identity {
    type = "SystemAssigned"
  }


  #role_based_access_control {
  #  enabled = true
  #}

  tags = {
    environment = "m.wiget@f5.com"
  }
}
