{
  climate_sensor_control_card(config):: {
    title: '%(name)s / Control' % config,
    type: 'entities',
    show_header_toggle: false,
    entities: [
      'input_number.%(id)s_%(domain)s_%(day_part)s' % (config { domain: domain, day_part: day_part.part })
      for domain in std.objectFields(config.domain)
      if std.objectHas(config.domain[domain], 'values')
      for day_part in config.domain[domain].values
    ] + [
      'input_number.%(id)s_%(domain)s' % (config { domain: domain })
      for domain in std.objectFields(config.domain)
      if std.objectHas(config.domain[domain], 'value')
    ],
  },
  climate_sensor_status_card(config):: {
    title: '%(name)s / Status' % config,
    type: 'entities',
    show_header_toggle: false,
    entities: [
      'sensor.%(id)s_actual_%(domain)s' % (config { domain: domain })
      for domain in std.objectFields(config.domain)
    ] + [
      'sensor.%(id)s_model_low_%(domain)s' % (config { domain: domain })
      for domain in std.objectFields(config.domain)
    ] + [
      'sensor.%(id)s_model_high_%(domain)s' % (config { domain: domain })
      for domain in std.objectFields(config.domain)
    ],
  },
  climate_sensor_entities_card(config):: {
    title: '%(name)s / Entities' % config,
    type: 'entities',
    show_header_toggle: false,
    entities: [
      config.domain[domain].sensor
      for domain in std.objectFields(config.domain)
    ] + [
      config.domain[domain].actuator
      for domain in std.objectFields(config.domain)
      if std.objectHas(config.domain[domain], 'actuator')
    ],
  },
  climate_sensor_view(config):: {
    title: config.name,
    cards: [
      $.climate_sensor_control_card(config),
      $.climate_sensor_status_card(config),
      $.climate_sensor_entities_card(config),
    ],
  },
}
