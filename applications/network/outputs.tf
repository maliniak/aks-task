output "subnet_db_id" {
  value = azurerm_subnet.subnet_db.id
}

output "subnet_aks_id" {
  value = azurerm_subnet.subnet_aks.id
}

output "network_resource_group" {
  value = azurerm_resource_group.wordpress.name
}


output "private_dns_zone_id" {
  value = azurerm_private_dns_zone.dns_zone.id
}
