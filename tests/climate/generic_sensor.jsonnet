local config = import 'home-assistant-libsonnet/config.libsonnet';
local mixins = (import 'climate-sensor-mixin/mixin.libsonnet') +
               (import 'gateway-mixin/mixin.libsonnet');

local parameters = {
  id: 'climate_sensor',
  name: 'Room Climate',
  domains: {
    temperature: {
      name: 'Temperature',
      sensor: 'sensor.temperature_id',
      value_dev: 2,
      value_min: 7,
      value_max: 45,
      value_day_parts: [
        { part: 'morning', value: 21.5, name: 'Morning' },
        { part: 'noon', value: 21.0, name: 'Noon' },
        { part: 'afternoon', value: 21.5, name: 'Afternoon' },
        { part: 'evening', value: 21, name: 'Evening' },
        { part: 'night', value: 19.0, name: 'Night' },
      ],
    },
    humidity: {
      name: 'Humidity',
      sensor: 'sensor.humidity_id',
      value_dev: 10,
      value_min: 20,
      value_max: 80,
      value: 50,
    },
  },
};

config.new(
  name='Xiaomi Aqara Climate Sensor (Temperature, Humidity)',
  frontend='lovelace',
  components={
    xiaomi_aqara_gateway:
      mixins.xiaomi_aqara_gateway_component({
        key: '<<key>>',
      }),
  },
  entities={
    climate_sensor:
      mixins.climate_sensor_entities(parameters),
  },
  dashboards={
    views: [
      mixins.climate_sensor_view(parameters),
    ],
  },
)
