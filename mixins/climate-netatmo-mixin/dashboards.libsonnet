{
  climate_netatmo_control_card(config):: {
    title: '%(name)s / Control' % config,
    type: 'entities',
    show_header_toggle: false,
    entities: [
    ],
  },
  climate_netatmo_status_card(config):: {
    title: '%(name)s / Status' % config,
    type: 'entities',
    show_header_toggle: false,
    entities: [
    ],
  },
  climate_netatmo_entities_card(config):: {
    title: '%(name)s / Entities' % config,
    type: 'entities',
    show_header_toggle: false,
    entities: [
    ],
  },
  climate_netatmo_view(config):: {
    title: config.name,
    cards: [
      $.climate_netatmo_control_card(config),
      $.climate_netatmo_status_card(config),
      $.climate_netatmo_entities_card(config),
    ],
  },
}
