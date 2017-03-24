base:
  'saltmaster':
    - salt
  'role:vault':
    - match: grain_pcre
    - vault
    - consul
