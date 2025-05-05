resource "azurerm_virtual_network" "vnet" {
  name                = "${var.environment}-vnet"
  address_space       = [var.vnet_address_space]
  location            = var.location
  resource_group_name = var.resource_group_name_network
}

resource "azurerm_subnet" "subnet_aks" {
  name                 = "${var.environment}-aks-subnet"
  resource_group_name  = var.resource_group_name_network
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_address_aks_prefix]
}

resource "azurerm_subnet" "subnet_db" {
  name                              = "${var.environment}-db-subnet"
  resource_group_name               = var.resource_group_name_network
  virtual_network_name              = azurerm_virtual_network.vnet.name
  address_prefixes                  = [var.subnet_address_db_prefix]
  private_endpoint_network_policies = "Enabled"
  service_endpoints                 = ["Microsoft.Storage"]
  delegation {
    name = "fs"
    service_delegation {
      name = "Microsoft.DBforMySQL/flexibleServers"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]
    }
  }
}

resource "azurerm_private_dns_zone" "dns_zone" {
  name                = "privatelink.mysql.database.azure.com"
  resource_group_name = var.resource_group_name_network
}

resource "azurerm_private_dns_zone_virtual_network_link" "db" {
  name                  = "vnet-link-to-mysql-private-dns"
  resource_group_name   = var.resource_group_name_network
  private_dns_zone_name = azurerm_private_dns_zone.dns_zone.name
  virtual_network_id    = azurerm_virtual_network.vnet.id
  registration_enabled  = true
}


