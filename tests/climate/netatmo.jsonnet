local config = import 'home-assistant-libsonnet/config.libsonnet';
local mixins = (import 'climate-netatmo-mixin/mixin.libsonnet');


local parameters = {
  id: 'climate_netatmo',
  component: {
    api_key: '<<api_key>>',
    secret_key: '<<api_key>>',
    username: '<<username>>',
    password: '<<password>>',
  },
  name: 'Netatmo Climate',
  home: 'location',
  room: 'room',
  monitored_conditions: [
    'temperature',
    'humidity',
    'noise',
    'battery_percent',
  ],
  domains: {
    temperature: {
      name: 'Temperature',
      value_dev: 2,
      value: 22,
    },
    humidity: {
      name: 'Humidity',
      value_dev: 10,
      value: 50,
    },
    co2: {
      name: 'CO2',
      value_dev: 500,
      value: 500,
      oper: 'above'
    },
  },
};

config.new(
  name='Climate',
  frontend='lovelace',
  components={
    netatmo_api:
      mixins.netatmo_api_component(parameters.component),
  },
  entities={
    climate_netatmo:
      mixins.climate_netatmo_entities(parameters),
  },
  dashboards={
    views: [
      mixins.climate_netatmo_view(parameters),
    ],
  },
)
