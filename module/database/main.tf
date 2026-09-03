resource "azurerm_private_dns_zone" "mysql" {
  name                = "privatelink.mysql.database.azure.com"
  resource_group_name = var.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "mysql" {
  name                  = "mysql-link"
  resource_group_name   = var.name

  private_dns_zone_name = azurerm_private_dns_zone.mysql.name

  virtual_network_id    = var.vnet_id
}

resource "azurerm_mysql_flexible_server" "db" {

  name                = "${var.env}-database"
  resource_group_name = var.name
  location            = var.location

  administrator_login    = var.db_username
  administrator_password = var.db_password

  delegated_subnet_id = var.private_subnet_id

  private_dns_zone_id = azurerm_private_dns_zone.mysql.id

  sku_name = "B_Standard_B1ms"

  version = "8.0.21"

  depends_on = [
    azurerm_private_dns_zone_virtual_network_link.mysql
  ]
  
}
