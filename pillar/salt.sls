{% from "tf.jinja" import tf_settings with context %}

salt:
    master:
        autosign_file: '/etc/salt/autosign.conf'

        fileserver_backend:
            - git
        gitfs_remotes:
            - 'file:///srv/git/system-definition':
                - root: roots
            - 'file:///srv/salt_root/salt-formula'

        pillar_roots:
          base:
            - /srv/git/terraform/config/terraform


        ext_pillar:
            - git:
                - 'file:///srv/git/system-config':
                    - root: pillar
    minion:
      id: {{ tf_settings.saltmaster_hostname }}
      grains:
        role: salt::master
