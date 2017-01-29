{% from "resourceConfig.jinja" import tf_settings with context %}

salt:
    master:
        autosign_file: '/etc/salt/autosign.conf'

        fileserver_backend:
            - git
        gitfs_remotes:
            - 'file:///srv/git/system-definition':
                - root: roots
            - 'file:///srv/salt_root/salt-formula'

        ext_pillar:
            - git:
                - 'file:///srv/git/resource-config':
                    - root: config
                - 'file:///srv/git/system-config':
                    - root: pillar
    minion:
      id: {{ tf_settings.zone.saltmaster_hostname }}
      startup_states: highstate
      grains:
        role: salt::master
        vdc: {{ tf_settings.vdc.vdc_name }}
        zone: {{ tf_settings.zone.appzone_name }}
        class: {{ tf_settings.class }}
