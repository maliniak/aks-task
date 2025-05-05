resource "helm_release" "external_dns" {
  count = var.cluster_available ? 1 : 0

  name       = "external-dns"
  namespace  = "kube-system"
  repository = "https://kubernetes-sigs.github.io/external-dns/"
  chart      = "external-dns"

  values = [file("${path.module}/templates/external-dns-values.yaml.tpl")]
}