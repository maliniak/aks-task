resource "helm_release" "external_dns" {
  count = var.cluster_available ? 1 : 0

  name       = "external-dns"
  namespace  = "kube-system"
  repository = "https://kubernetes-sigs.github.io/external-dns/"
  chart      = "external-dns"

  values = [file("${path.module}/templates/external-dns-values.yaml.tpl")]
}

#resource "azurerm_dns_zone" "wordpress_zone" {
#  name                = "ops-bewerber-11.pg.senecops.com"
#  resource_group_name = var.network_resource_group
#}
#
#resource "azurerm_role_assignment" "external_dns" {
#  principal_id         = module.aks.kubelet_identity_object_id
#  role_definition_name = "DNS Zone Contributor"
#  scope                = azurerm_dns_zone.wordpress_zone.id
#}