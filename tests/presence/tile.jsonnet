local config = import 'home-assistant-libsonnet/config.libsonnet';
local mixins = (import 'presence-tile-mixin/mixin.libsonnet');

local parameters = {
  id: 'presence_tile',
  name: 'Tile Tracker',
  username: '<<username>>',
  password: '<<password>>',
};

config.new(
  name='Tile Presence Tracker',
  frontend='simple',
  components={},
  dashboards={},
  entities={
    presence_tile:
      mixins.presence_tile_entities(parameters),
  },
)
