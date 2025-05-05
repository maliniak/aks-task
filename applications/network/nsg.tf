resource "azurerm_network_security_group" "aks_nsg" {
  name                = "${var.environment}-aks-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name_network
}

resource "azurerm_network_security_rule" "allow_http_ingress" {
  name                        = "Allow-HTTP-Ingress"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_ranges     = ["80","443","30913", "32365"]
  source_address_prefix       = "*"
  destination_address_prefix  = "*"

  resource_group_name         = var.resource_group_name_network
  network_security_group_name = azurerm_network_security_group.aks_nsg.name
}

resource "azurerm_public_ip" "lb_ip" {
  name                = "${var.environment}-aks-lb-ip"
  location            = var.location
  resource_group_name = var.resource_group_name_network
  allocation_method   = "Static"
  sku                 = "Standard"
}


resource "azurerm_subnet_network_security_group_association" "aks_nsg_association" {
  subnet_id                 = azurerm_subnet.subnet_aks.id
  network_security_group_id = azurerm_network_security_group.aks_nsg.id
}