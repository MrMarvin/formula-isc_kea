{% from "kea/map.jinja" import kea with context %}

include:
  - .init

{%- if salt['pillar.get']('kea:kea.conf', False) %}
kea.conf:
  file.managed:
    - name: {{ kea.config }}
    - contents_pillar: 'kea:kea.conf'
    - user: root
    - group: root
    - mode: 644
{%- endif %}