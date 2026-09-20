resource "azurerm_kubernetes_cluster" "aks" {
  name                      = "${var.env}-aks1"
  location                  = var.location
  resource_group_name       = var.resource_group_name
  dns_prefix                = var.env
  kubernetes_version        = var.aks_version
  private_cluster_enabled   = false
  node_resource_group       = "PCIDSS-bank-AKS-nodes"
  sku_tier                  = "Free"
  oidc_issuer_enabled       = true
  workload_identity_enabled = true

  network_profile {
    network_plugin = "azure"
    dns_service_ip = "10.0.5.10"
    service_cidr   = "10.0.5.0/24"
  }
  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "gStandard_D2_v3"
  }
  node_provisioning_profile {
    mode = "Manual"
  }


  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = var.env
  }
}

  