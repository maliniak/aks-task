resource "kubernetes_namespace" "helm_charts_namespace" {
  count = var.cluster_available && var.cert_manager_available ? 1 : 0

  metadata {
    name = "wordpress"
    labels = {
      name = "wordpress"
    }
  }
}

resource "kubernetes_namespace" "helm_charts_namespace_ingress" {
  count = var.cluster_available && var.cert_manager_available ? 1 : 0

  metadata {
    name = "ingress-nginx"
    labels = {
      name = "wordpress"
    }
  }
}


resource "helm_release" "nginx_ingress" {
  count = var.cluster_available && var.cert_manager_available ? 1 : 0


  name       = "nginx-ingress"
  namespace  = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = "4.0.13"
}

resource "helm_release" "wordpress" {
  count = var.cluster_available && var.cert_manager_available ? 1 : 0

  name       = "wordpress"
  namespace  = kubernetes_namespace.helm_charts_namespace[0].id
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "wordpress"
  version    = "16.0.2"
  values = [
    templatefile("${path.module}/helm/wordpress-values.yaml.tpl", {
      hostname = "wp.ops-bewerber-11.pg.senecops.com"
      db_host  = var.db_hostname
    })
  ]
}




