resource "azurerm_user_assigned_identity" "this" {
  name                = Base
  resource_group_name = var.resource_group_name
  location            = var.location

}

resource "azurerm_role_assignment" "network_contributor" {
  scope                = azurerm_virtual_network.rg.id
  role_definition_name = "Network Contributor"
  principal_id         = var.principal_id
}