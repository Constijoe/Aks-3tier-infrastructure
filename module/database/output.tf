output "database_endpoint" {
  value = azurerm_mysql_flexible_server.db.fqdn
}
output "private_dns_zone_id" {
  value = azurerm_private_dns_zone.mysql.id
}