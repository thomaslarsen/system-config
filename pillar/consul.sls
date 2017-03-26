{% from "resourceConfig.jinja" import tf_settings with context %}

consul:
  config:
    server: True
    bind_addr: "0.0.0.0"

    enable_debug: True
    bootstrap_expect: 1
    ui: True
    client_addr: 0.0.0.0

  register:
    - name: consul
      tags:
        - web
      port: {{ tf_settings.zone.consul_port }}
    - name: dns
      port: 53
