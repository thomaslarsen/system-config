salt:
    master:
        autosign_file: '/etc/salt/autosign.conf'

        fileserver_backend:
            - git
        gitfs_remotes:
            - 'file:///srv/git/system-definition':
              root: roots
            - 'git://github.com/saltstack-formulas/salt-formula.git':
              root: .
            - 'git://github.com/saltstack-formulas/consul-formula.git':
              root: .

        ext_pillar:
          git:
            - 'file:///srv/git/system-config':
              root: pillar
