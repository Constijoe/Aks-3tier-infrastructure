output "database_endpoint" {
  value = azurerm_mysql_flexible_server.db.fqdn
}