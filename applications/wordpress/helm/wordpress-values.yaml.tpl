replicaCount: 1 # change to 3

ingress:
  enabled: true
  hostname: ${hostname}
  tls: true
  annotations:
    kubernetes.io/ingress.class: nginx
    cert-manager.io/cluster-issuer: "letsencrypt-prod"

mariadb:
  enabled: false

image:
  debug: true

externalDatabase:
  host: ${db_host}
  port: 3306
  user: psqladmin
  database: wordpressdb
  existingSecret: wordpress-externaldb
