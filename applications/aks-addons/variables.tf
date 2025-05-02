variable "network_resource_group" {
  description = "The name of the Azure Resource Group that contains the virtual network and related networking resources."
  type        = string
}

variable "host" {
  description = "The fully qualified domain name (FQDN) used to expose the WordPress application via Ingress."
  type        = string
}

variable "client_certificate" {
  description = "The base64-encoded client certificate used to authenticate with the Kubernetes API server."
  type        = string
}

variable "client_key" {
  description = "The base64-encoded private key associated with the Kubernetes client certificate."
  type        = string
}

variable "cluster_ca_certificate" {
  description = "The base64-encoded certificate authority data required to verify the Kubernetes API server's certificate."
  type        = string
}

variable "cluster_available" {
  description = "Boolean flag to indicate whether the AKS cluster is available and Terraform should proceed with related resource creation."
  type        = bool
}

variable "cert_manager" {
  description = "Boolean flag to indicate whether cert-manager is installed and available for use in the cluster."
  type        = bool
}
