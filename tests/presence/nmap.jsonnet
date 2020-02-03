local config = import 'home-assistant-libsonnet/config.libsonnet';
local mixins = (import 'presence-nmap-mixin/mixin.libsonnet');

local parameters = {
  id: 'presence_nmap',
  name: 'NMAP Tracker',
  hosts: '10.0.0.100-200',
};

config.new(
  name='NMAP Presence Tracker',
  frontend='simple',
  components={},
  dashboards={},
  entities={
    presence_nmap:
      mixins.presence_nmap_entities(parameters),
  },
)
