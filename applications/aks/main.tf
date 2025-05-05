resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-cluster"
  location            = var.location
  resource_group_name = var.resource_group_name_aks
  dns_prefix          = "aks-k8s"
  kubernetes_version  = "1.32.1"

  default_node_pool {
    name            = "default"
    temporary_name_for_rotation = "defaulttemp"
    node_count      = 3
    vm_size         = "Standard_DS2_v2"
    os_disk_size_gb = 30
    vnet_subnet_id  = var.subnet_id

    upgrade_settings {
      max_surge                     = "10%"
      drain_timeout_in_minutes      = 0
      node_soak_duration_in_minutes = 0
    }
  }

  identity {
    type = "SystemAssigned"
  }

  linux_profile {
    admin_username = "aksadmin"

    ssh_key {
      key_data = azapi_resource_action.ssh_public_key_gen.output.publicKey
    }
  }

  role_based_access_control_enabled = true

  network_profile {
    network_plugin = "azure"
    dns_service_ip = "10.0.10.10"
    service_cidr   = "10.0.10.0/24"
    pod_cidr       = null
    load_balancer_sku = "standard"

  }
}
