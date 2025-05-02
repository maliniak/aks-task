variable "resource_group_name" {
  description = "The name of the Resource Group"
  type        = string
}

variable "vnet_name" {
  description = "The name of the Virtual Network"
  type        = string
}

variable "environment" {
  description = "The environment to deploy (dev, staging, prod)"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space for the VNet"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_address_aks_prefix" {
  description = "Address prefix for the aks subnet"
  type        = string
}

variable "subnet_address_db_prefix" {
  description = "Address prefix for the db subnet"
  type        = string
}
