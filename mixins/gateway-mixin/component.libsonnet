{
  homeconnect_api_component(config):: {
    kind: 'homeconnect',
    client_id: config.client_id,
    client_secret: config.client_secret,
  },
  phillips_hue_gateway_component(config):: {
    kind: 'hue',
    host: config.host,
    username: config.username,
    allow_unreachable: true,
    allow_hue_groups: true,
  },
  xiaomi_aqara_gateway_component(config):: {
    kind: 'xiaomi_aqara',
    key: config.key,
    discovery_retry: 5,
  },
}
