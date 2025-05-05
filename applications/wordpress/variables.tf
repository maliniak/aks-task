variable "db_hostname" {
  description = "The hostname or endpoint of the external database server (e.g., MariaDB or PostgreSQL) used by the WordPress application."
  type        = string
}

variable "cluster_available" {
  description = "Flag indicating whether the AKS cluster is available and Terraform resources depending on it should be deployed."
  type        = bool
}

variable "cert_manager_available" {
  description = "Flag indicating whether cert-manager has been deployed and is available for issuing TLS certificates."
  type        = bool
}

variable "host" {
  description = "The fully qualified domain name (FQDN) used for exposing the WordPress Ingress (e.g., wp.example.com)."
  type        = string
}

variable "client_certificate" {
  description = "The client certificate used to authenticate to the Kubernetes cluster when connecting via kubectl or Terraform providers."
  type        = string
}

variable "client_key" {
  description = "The private key associated with the client certificate for Kubernetes cluster authentication."
  type        = string
}

variable "cluster_ca_certificate" {
  description = "The certificate authority (CA) certificate for verifying the Kubernetes API server's certificate."
  type        = string
}