local component = (import 'component.libsonnet');
local entity = (import 'entity.libsonnet');
local dashboard = (import 'dashboard.libsonnet');

{
  _config+:: {
    entity+: {
      climate_sensor_entities: entity.climate_sensor_entities,
    },
    dashboard+: {
      climate_sensor_view: dashboard.climate_sensor_view,
      climate_sensor_control_card: dashboard.climate_sensor_control_card,
      climate_sensor_status_card: dashboard.climate_sensor_status_card,
      climate_sensor_entities_card: dashboard.climate_sensor_entities_card,
    },
  },
}
