{
  media_sony_bravia_tv_control_card(config):: {
    title: '%(name)s / Control' % config,
    type: 'entities',
    show_header_toggle: false,
    entities: [
      'input_select.%(id)s_sources' % config,
      'input_number.%(id)s_volume' % config,
      'script.%(id)s_source_set' % config,
      'script.%(id)s_volume_down' % config,
      'script.%(id)s_volume_up' % config,
      'script.%(id)s_volume_set' % config,
      'script.%(id)s_power_on' % config,
      'script.%(id)s_power_off' % config,
      'automation.%(id)s_volume_init' % config,
      'automation.%(id)s_volume_update' % config,
    ],
  },
  media_sony_bravia_tv_status_card(config):: {
    title: '%(name)s / Status' % config,
    type: 'entities',
    show_header_toggle: false,
    entities: [
      'binary_sensor.%(id)s_power_state' % config,
      'sensor.%(id)s_source' % config,
      'sensor.%(id)s_volume' % config,
    ],
  },
  media_sony_bravia_tv_entities_card(config):: {
    title: '%(name)s / Entities' % config,
    type: 'entities',
    show_header_toggle: false,
    entities: [
      'media_player.%(device)s' % config,
    ],
  },
  media_sony_bravia_tv_view(config):: {
    title: config.name,
    cards: [
      $.media_sony_bravia_tv_control_card(config),
      $.media_sony_bravia_tv_status_card(config),
      $.media_sony_bravia_tv_entities_card(config),
    ],
  },
}
