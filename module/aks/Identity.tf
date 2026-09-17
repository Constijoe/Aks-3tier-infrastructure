resource "azurerm_user_assigned_identity" "this" {
  name                = "base"
  resource_group_name = var.resource_group_name
  location            = var.location

}

resource "azurerm_role_assignment" "network_contributor" {
  scope                = var.vnet_id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_user_assigned_identity.this.principal_id
}