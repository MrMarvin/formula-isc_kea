{% from "kea/map.jinja" import kea with context %}

{{ kea.pkg }}:
  pkg.installed


{% if grains['os'] == 'Ubuntu' and grains['osrelease'] == '14.04' %}
/etc/init/kea-dhcp4.conf:
  file.managed:
    - source: salt://kea/files/upstart.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - context:
      bin: {{kea.bin_dhcp4}}
      conf: {{kea.config}}

/etc/init/kea-dhcp6.conf:
  file.managed:
    - source: salt://kea/files/upstart.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - context:
      bin: {{kea.bin_dhcp6}}
      conf: {{kea.config}}

/etc/init/kea-dhcp-ddns.conf:
  file.managed:
    - source: salt://kea/files/upstart.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - context:
      bin: {{kea.bin_dhcpddns}}
      conf: {{kea.config}}

{% endif %}
