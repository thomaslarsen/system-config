{% import_json 'salt://terraform/settings/zones.mtzo.json' as server_list %}

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
