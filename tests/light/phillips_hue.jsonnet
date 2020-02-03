local config = import 'home-assistant-libsonnet/config.libsonnet';
local mixins = (import 'light-phillips-hue-mixin/mixin.libsonnet') +
               (import 'gateway-mixin/mixin.libsonnet');

local parameters = {
  id: 'light_phillips_hue_color',
  name: 'Lights',
  hue_group: 'livingroom',
  hue_lights: [
    'light.livingroom',
  ],
  scenes: [
    'Bright',
    'Relax',
    'Arctic aurora',
    'Savanna sunset',
    'Nightlight',
    'Dimmed',
    'Read',
  ],
  initial_scene: 'Relax',
  initial_brightness: 128,
};

config.new(
  name='Phillips Hue Lights',
  frontend='lovelace',
  components={
    phillips_hue_gateway:
      mixins.phillips_hue_gateway_component({
        host: '<<host/ip>>',
        username: '<<username>>',
      }),
  },
  entities={
    light_phillips_hue_color:
      mixins.light_phillips_hue_color_entities(parameters),
  },
  dashboards={
    views: [
      mixins.light_phillips_hue_color_view(parameters),
    ],
  },
)
