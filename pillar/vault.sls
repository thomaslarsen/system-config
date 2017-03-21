{% from "resourceConfig.jinja" import tf_settings with context %}

vault:
  overrides:
    keybase_users:
      - renaissancedev
      - pdpinch
      - bdero
    secret_shares: 3
    secret_threshold: 2
    tls_disable: 1
    ssl:
      cert_params:
        CN: {{ tf_settings.vdc.root_domain }}
    config:
      backend:
        file:
          path: /var/vault/data
