resource "azurerm_kubernetes_cluster" "example" {
  name                = "${env}-aks1"
  location            = var.location
  resource_group_name = var.name
  dns_prefix          = "exampleaks1"
  kubernetes_version = var.aks_version
  private_cluster_enabled = false
  node_resource_group = var.name
  sku_tier = "free"
  oidc_issuer_enabled = true
  workload_identity_enabled = true

  network_profile {
    network_plugin = "azure"
    dns_service_ip = "10.0.5.10"
    service_cidr = "10.0.5.0/24"
  }
  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = var.env
  }
}
  
  