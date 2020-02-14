local entity = (import 'entity.libsonnet');
local dashboard = (import 'dashboard.libsonnet');

{
  _config+:: {
    entity+: {
      light_phillips_hue_color_entities: entity.light_phillips_hue_color_entities,
    },
    dashboard+: {
      light_phillips_hue_color_view: dashboard.light_phillips_hue_color_view,
      light_phillips_hue_color_control_card: dashboard.light_phillips_hue_color_control_card,
      light_phillips_hue_color_status_card: dashboard.light_phillips_hue_color_status_card,
      light_phillips_hue_color_entities_card: dashboard.light_phillips_hue_color_entities_card,
    },
  },
}
