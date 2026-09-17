resource "azurerm_kubernetes_cluster_node_pool" "example" {
  name                  = "internal"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size               = "Standard_DS2_v2"

  auto_scaling_enabled = true
  node_count           = 2
  min_count            = 1
  max_count            = 10

  tags = {
    Environment = var.env
  }

  lifecycle {
    ignore_changes = [node_count]
  }
}