{% from "resourceConfig.jinja" import tf_settings with context %}

vault:
  lookup:
    init:
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
    listener:
      tcp:
        tls_disable: 1
        address: 0.0.0.0:{{ tf_settings.zone.vault_port }}
    backend:
      file:
        path: /var/vault/data
