resource "azurerm_resource_group" "aks" {
  name     = "rg-aks"
  location = "westeurope"
}

#resource "azurerm_resource_group" "db_1" {
#  name     = "rg-db"
#  location = "westeurope"
#}

resource "azurerm_resource_group" "db" {
  name     = "rg-database"
  location = "westeurope"
}

resource "azurerm_resource_group" "network" {
  name     = "rg-network"
  location = "westeurope"
}
