local component = (import 'component.libsonnet');

{
  _config+:: {
    integration+: {
      homeconnect_api_component: component.homeconnect_api_component,
      phillips_hue_gateway_component: component.phillips_hue_gateway_component,
      xiaomi_aqara_gateway_component: component.xiaomi_aqara_gateway_component,
    },
  },
}
