local component = (import 'component.libsonnet');
local entity = (import 'entity.libsonnet');
local dashboard = (import 'dashboard.libsonnet');

{
  _config+:: {
    integration+: {
      sony_bravia_tv_component: component.sony_bravia_tv_component,
    },
    entity+: {
      media_sony_bravia_tv_entities: entity.media_sony_bravia_tv_entities,
    },
    dashboard+: {
      media_sony_bravia_tv_view: dashboard.media_sony_bravia_tv_view,
      media_sony_bravia_tv_control_card: dashboard.media_sony_bravia_tv_control_card,
      media_sony_bravia_tv_status_card: dashboard.media_sony_bravia_tv_status_card,
      media_sony_bravia_tv_entities_card: dashboard.media_sony_bravia_tv_entities_card,
    },
  },
}
