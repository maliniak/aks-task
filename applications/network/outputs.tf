output "subnet_db_id" {
  value = azurerm_subnet.subnet_db.id
}

output "subnet_aks_id" {
  value = azurerm_subnet.subnet_aks.id
}


output "private_dns_zone_id" {
  value = azurerm_private_dns_zone.dns_zone.id
}
