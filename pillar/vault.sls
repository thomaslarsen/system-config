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
      listener:
        tcp:
          tls_disable: 1
          tls_cert_file: /etc/salt/ssl/certs/{{ tf_settings.vdc.root_domain }}.crt
          tls_key_file: /etc/salt/ssl/certs/{{ tf_settings.vdc.root_domain }}.key
      backend:
        file:
          path: /var/vault/data
