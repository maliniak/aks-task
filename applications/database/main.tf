data "azurerm_key_vault_secret" "mysql_admin_password" {
  name         = azurerm_key_vault_secret.mysql_admin_password.name
  key_vault_id = azurerm_key_vault.mysql_kv.id
}


resource "azurerm_mysql_flexible_server" "db" {
  name                   = "mysql-flexible-aks"
  resource_group_name    = var.resource_group_name_db
  location               = var.location
  administrator_login    = "psqladmin"
  administrator_password = data.azurerm_key_vault_secret.mysql_admin_password.value
  version                = "8.0.21"
  backup_retention_days  = 7
  delegated_subnet_id    = var.subnet_id
  private_dns_zone_id    = var.private_dns_zone_id
  sku_name               = "GP_Standard_D2ds_v4"

  public_network_access = "Disabled"

}

resource "azurerm_mysql_flexible_database" "db" {
  name                = "wordpressdb"
  resource_group_name = var.resource_group_name_db
  server_name         = azurerm_mysql_flexible_server.db.name
  charset             = "utf8mb3"
  collation           = "utf8mb3_unicode_ci"

}

resource "azurerm_mysql_flexible_server_configuration" "db" {
  name                = "require_secure_transport"
  resource_group_name = var.resource_group_name_db
  server_name         = azurerm_mysql_flexible_server.db.name
  value               = "off"
}