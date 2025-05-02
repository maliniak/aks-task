resource "helm_release" "cert_manager" {
  count = var.cluster_available ? 1 : 0

  name             = "cert-manager"
  namespace        = "cert-manager"
  create_namespace = true

  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  version    = "v1.17.2"

  values = [
    <<-EOT
    installCRDs: true
    EOT
  ]

}