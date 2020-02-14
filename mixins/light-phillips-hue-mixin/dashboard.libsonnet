{
  light_phillips_hue_color_control_card(config):: {
    title: '%(name)s / Control' % config,
    type: 'entities',
    show_header_toggle: false,
    entities: [
      'input_select.%(id)s_scenes' % config,
      'input_number.%(id)s_brightness' % config,
      'script.%(id)s_scene_set' % config,
      'script.%(id)s_brightness_down' % config,
      'script.%(id)s_brightness_up' % config,
      'script.%(id)s_brightness_set' % config,
      'script.%(id)s_turn_off' % config,
      'automation.%(id)s_scene_set' % config,
      'automation.%(id)s_brightness_init' % config,
      'automation.%(id)s_brightness_update' % config,
      'automation.%(id)s_brightness_set' % config,
    ],
  },
  light_phillips_hue_color_status_card(config):: {
    title: '%(name)s / Status' % config,
    type: 'entities',
    show_header_toggle: false,
    entities: [
      'binary_sensor.%(id)s_power_state' % config,
      'sensor.%(id)s_scene' % config,
      'sensor.%(id)s_brightness' % config,
    ],
  },
  light_phillips_hue_color_entities_card(config):: {
    title: '%(name)s / Entities' % config,
    type: 'entities',
    show_header_toggle: false,
    entities: config.hue_lights,
  },
  light_phillips_hue_color_view(config):: {
    title: config.name,
    cards: [
      $.light_phillips_hue_color_control_card(config),
      $.light_phillips_hue_color_status_card(config),
      $.light_phillips_hue_color_entities_card(config),
    ],
  },
}
