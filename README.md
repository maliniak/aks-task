# Azure WordPress Infrastructure Automation

## Overview
This project deploys:
- Azure MySQL database
- AKS Cluster
- WordPress (with 1/3 replicas)
- Nginx Ingress Controller
- External-DNS and Cert-Manager
- TLS certificate from Let's Encrypt

## Structure

- `applications/network` - deploys some basic network
- `applications/aks` — deploys AKS cluster
- `applications/database` — deploys MySQL
- `applications/aks-addons` - deploys addons after cluster creation
- `applications/wordpress` — installs WordPress

## How to Use
```bash
cd /deployments/prod
terraform init
Please provision resources:
terraform apply -var="cluster_available=false" -var="cert_manager_available=false"
terraform apply -var="cluster_available=true" -var="cert_manager_available=false"
terraform apply -var="cluster_available=true" -var="cert_manager_available=true"

