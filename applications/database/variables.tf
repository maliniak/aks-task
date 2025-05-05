variable "subnet_id" {
  description = "The name of the Subnet"
  type        = string
}

variable "private_dns_zone_id" {
  description = "The name of the private dns zone"
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

variable "resource_group_name_db" {
  description = "Resource group"
  type        = string
}

#variable "resource_group_name_db_1" {
#  description = "Resource group"
#  type        = string
#}
