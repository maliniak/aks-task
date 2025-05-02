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

- `modules/network` - deplloys some basic network
- `modules/aks` — deploys AKS cluster
- `modules/database` — deploys PostgreSQL
- `modules/aks-addons` - deploys addons after cluster creation
- `modules/wordpress` — installs WordPress

## How to Use
```bash
terraform init
terraform plan
terraform apply
