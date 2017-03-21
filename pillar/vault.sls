{% from "resourceConfig.jinja" import tf_settings with context %}

vault:
  overrides:
    keybase_users:
      - renaissancedev
      - pdpinch
      - bdero
    secret_shares: 3
    secret_threshold: 2
    ssl:
      cert_params:
        CN: {{ tf_settings.vdc.root_domain }}
    config:
      tls_disable: 1
      backend:
        file:
          path: /var/vault/data
