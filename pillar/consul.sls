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
      port: 8500
    - name: dns
      port: 53
