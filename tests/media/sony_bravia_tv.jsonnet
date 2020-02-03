local config = import 'home-assistant-libsonnet/config.libsonnet';
local mixins = (import 'media-sony-bravia-tv-mixin/mixin.libsonnet');

local parameters = {
  id: 'media_sony_bravia_tv',
  name: 'TV',
  device: 'sony_bravia_tv',
  host: '<<host/ip>>',
  sources: [
    'CT 1 HD',
    'CT 2 HD',
    'CT 24 HD',
    'CT :D HD / CT art HD',
    'Nova HD',
  ],
  initial_source: 'CT 1 HD',
  initial_volume: 0.01,
};

config.new(
  name='Sony Bravia TV',
  frontend='lovelace',
  components={
    sony_bravia_tv:
      mixins.sony_bravia_tv_component({
        host: '<<host/ip>>',
        mac: '<<mac>>',
        pin: '0000',
      }),
  },
  entities={
    media_sony_bravia_tv:
      mixins.media_sony_bravia_tv_entities(parameters),
  },
  dashboards={
    views: [
      mixins.media_sony_bravia_tv_view(parameters),
    ],
  },
)
