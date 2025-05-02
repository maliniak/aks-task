module "network" {
  source                    = "../../applications/network"
  resource_group_name       = "rg-wordpress"
  location                  = "westeurope"
  vnet_name                 = "vnet-wordpress"
  vnet_address_space        = "10.2.0.0/16"
  subnet_address_aks_prefix = "10.2.1.0/24" ## DAC TROCHĘ WIĘCEJ
  subnet_address_db_prefix  = "10.2.2.0/24"
  environment               = "prod"
}

module "database" {
  source              = "../../applications/database"
  subnet_id           = module.network.subnet_db_id
  private_dns_zone_id = module.network.private_dns_zone_id
  environment         = "prod"
}

module "aks" {
  source                 = "../../applications/aks"
  network_resource_group = module.network.network_resource_group
  subnet_id              = module.network.subnet_aks_id
}

module "aks-addons" {
  source                 = "../../applications/aks-addons"
  cluster_available      = true
  cert_manager           = true
  network_resource_group = module.network.network_resource_group
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
  network_resource_group = module.network.network_resource_group
}
