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
            - 'file:///srv/git/terraform':
                - root: config
                - mountpoint: 'salt://terraform/settings'

        ext_pillar:
            - git:
                - 'file:///srv/git/system-config':
                    - root: pillar
    minion:
      grains:
        role: salt::master
