provider:
  name: aws
env:
  - name: AWS_REGION
    value: "us-west-2"

  - name: AWS_ACCESS_KEY_ID
    valueFrom:
      secretKeyRef:
        name: aws-credentials
        key: aws_access_key_id

  - name: AWS_SECRET_ACCESS_KEY
    valueFrom:
      secretKeyRef:
        name: aws-credentials
        key: aws_secret_access_key

domainFilters:
  - ops-bewerbung-11.pg.senecops.com

txtOwnerId: aks-cluster
logLevel: debug

policy: sync

sources:
  - ingress

registry: txt