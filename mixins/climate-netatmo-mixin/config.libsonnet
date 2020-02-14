local component = (import 'component.libsonnet');
local entity = (import 'entity.libsonnet');
local dashboard = (import 'dashboard.libsonnet');

{
  _config+:: {
    integration+: {
      netatmo_api_component: component.netatmo_api_component,
    },
    entity+: {
      climate_netatmo_entities: entity.climate_netatmo_entities,
    },
    dashboard+: {
      climate_netatmo_view: dashboard.climate_netatmo_view,
      climate_netatmo_control_card: dashboard.climate_netatmo_control_card,
      climate_netatmo_status_card: dashboard.climate_netatmo_status_card,
      climate_netatmo_entities_card: dashboard.climate_netatmo_entities_card,
    },
  },
}
