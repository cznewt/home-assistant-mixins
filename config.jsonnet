local hass = import 'vendor/home-assistant-libsonnet/config.libsonnet';
local esphome = import 'vendor/esphome-libsonnet/config.libsonnet';
local mixins = (import 'mixins/light-phillips-hue-mixin/mixin.libsonnet') +
               (import 'mixins/gateway-mixin/mixin.libsonnet');

local hass_parameters = {
  id: 'light_phillips_hue_color',
  name: 'Lights',
  hue_group: 'room',
  hue_lights: [
    'light.room',
  ],
  scenes: [
    'Bright',
    'Relax',
    'Read',
    'Concentrate',
    'Dimmed',
    'Nightlight',
  ],
  initial_scene: 'Relax',
  initial_brightness: 128,
};

local esphome_parameters = {
  core: {
    id: 'sensor_bh1750',
    name: 'Sensor BH1750',
  },
  components: {
    sensor: {
      ['%(id)s_light' % $.core]: {
        platform: 'bh1750',
        name: '%(name)s Illuminance' % $.core,
        address: '0x23',
        update_interval: '60s',
      },
    },
  },
};

hass.new(
  name='Composite Example',
  frontend='lovelace',
  components={
    phillips_hue_gateway:
      mixins.phillips_hue_gateway_component({
        host: '10.0.0.10',
        username: '<<username>>',
      }),
  },
  entities={
    light_phillips_hue_color:
      mixins.light_phillips_hue_color_entities(hass_parameters),
  },
  dashboards={
    views: [
      mixins.light_phillips_hue_color_view(hass_parameters),
    ],
  },
) +
esphome.new(
  devices={
    esphome_sensor_01: esphome_parameters,
  },
)