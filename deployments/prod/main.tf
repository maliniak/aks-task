module "network" {
  source                    = "../../applications/network"
  resource_group_name_network   =  azurerm_resource_group.network.name
  location                  = "westeurope"
  vnet_name                 = "vnet-wordpress"
  vnet_address_space        = "10.2.0.0/16"
  subnet_address_aks_prefix = "10.2.1.0/24"
  subnet_address_db_prefix  = "10.2.2.0/24"
  environment               = "prod"
}

module "database" {
  source              = "../../applications/database"
  subnet_id           = module.network.subnet_db_id
  location            = "westeurope"
  private_dns_zone_id = module.network.private_dns_zone_id
  #resource_group_name_db_1 = azurerm_resource_group.db_1.name
  resource_group_name_db = azurerm_resource_group.db.name
  environment         = "prod"
}

module "aks" {
  source                  = "../../applications/aks"
  subnet_id               = module.network.subnet_aks_id
  location                = "westeurope"
  resource_group_name_aks = azurerm_resource_group.aks.name
  resource_group_id_aks   = azurerm_resource_group.aks.id
}

module "aks-addons" {
  source                 = "../../applications/aks-addons"
  cluster_available      = true
  cert_manager           = true
  host                   = module.aks.host
  client_certificate     = module.aks.client_certificate
  client_key             = module.aks.client_key
  cluster_ca_certificate = module.aks.cluster_ca_certificate
}

module "wordpress" {
  source                 = "../../applications/wordpress"
  cluster_available      = true
  cert_manager_available = true
  host                   = module.aks.host
  client_certificate     = module.aks.client_certificate
  client_key             = module.aks.client_key
  cluster_ca_certificate = module.aks.cluster_ca_certificate
  db_hostname            = module.database.db_hostname
}
