resource "random_password" "mysql_admin_password" {
  length           = 16
  lower            = true
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "mysql_kv" {
  name                        = "mysql-kv-aks-${var.environment}"
  location                    = azurerm_resource_group.db.location
  resource_group_name         = azurerm_resource_group.db.name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"
  purge_protection_enabled    = true

  soft_delete_retention_days  = 7

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    secret_permissions = [
      "Get",
      "Set",
      "List",
    ]
  }
}

resource "azurerm_key_vault_secret" "mysql_admin_password" {
  name         = "mysql-admin-password"
  value        = random_password.mysql_admin_password.result
  key_vault_id = azurerm_key_vault.mysql_kv.id
}