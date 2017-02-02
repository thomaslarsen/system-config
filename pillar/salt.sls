{% from "resourceConfig.jinja" import tf_settings with context %}

salt:
    master:
        autosign_file: '/etc/salt/autosign.conf'

        fileserver_backend:
            - git
        gitfs_remotes:
            - 'https://github.com/thomaslarsen/system-definition.git':
                - root: roots
            - 'https://github.com/thomaslarsen/salt-formula.git'

        ext_pillar:
            - git:
                - 'https://github.com/thomaslarsen/resource-config.git':
                    - root: config
                - 'https://github.com/thomaslarsen/system-config.git':
                    - root: pillar
    minion:
      id: {{ tf_settings.zone.saltmaster_hostname }}
      startup_states: highstate
      grains:
        role: salt::master
        vdc: {{ tf_settings.vdc.vdc_name }}
        zone: {{ tf_settings.zone.appzone_name }}
        class: {{ tf_settings.class }}
