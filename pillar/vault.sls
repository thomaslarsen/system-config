{% from "resourceConfig.jinja" import tf_settings with context %}

vault:
  lookup:
    setup:
      unseal_gpg_keys:
        keybase:
          - thomaslarsen
          - pdpinch
          - bdero
      roottoken_pgp_key: keybase:thomaslarsen
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
      consul:
        address: 127.0.0.1:{{ tf_settings.zone.consul_port }}
        path: vault/
