variable "subnet_id" {
  description = "The name of the Subnet"
  type        = string
}

variable "location" {
  description = "Region"
  type        = string
}

variable "resource_group_name_aks" {
  description = "The name of the Resouce Group with AKS"
  type        = string
}

variable "resource_group_id_aks" {
  description = "The name of the id of resource group"
  type        = string
}