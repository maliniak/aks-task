resource "kubernetes_manifest" "clusterissuer_letsencrypt_prod" {
  count = var.cluster_available && var.cert_manager ? 1 : 0

  manifest = {
    "apiVersion" = "cert-manager.io/v1"
    "kind"       = "ClusterIssuer"
    "metadata" = {
      "name" = "letsencrypt-prod"
    }
    "spec" = {
      "acme" = {
        "email" = "malinowski.ml@gmail.com"
        "privateKeySecretRef" = {
          "name" = "letsencrypt-prod"
        }
        "server" = "https://acme-v02.api.letsencrypt.org/directory"
        "solvers" = [
          {
            "http01" = {
              "ingress" = {
                "ingressClassName" = "nginx"
                }
              }
          },
          {
            "dns01" = {
              "route53" = {
                "region" = "us-west-2"
                "accessKeyId" = "AKIA22A5NNLDHX3HRXHY"
                "hostedZoneId" = "Z06207411JABIMXGYXLPH"
                "secretAccessKeySecretRef" = {
                  "name" = "route53-credentials"
                  "key" = "secret-access-key"
                  }
               }
            }
          "selector" = {
            "dnsZones" = ["ops-bewerbung-11.pg.senecops.com"]
            }
          },
        ]
      }
    }
  }

}