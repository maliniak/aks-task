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