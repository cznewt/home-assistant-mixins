{
  media_sony_bravia_tv_entities(config):: {
    media_player: {
      [config.device]: {
        platform: 'braviatv',
        host: config.host
      },
    },
    input_select: {
      ['%(id)s_sources' % config]: {
        name: 'Select Source',
        options: config.sources,
        [if std.objectHas(config, 'initial_source') then 'initial']:
          config.initial_source,
      },
    },
    input_number: {
      ['%(id)s_volume' % config]: {
        name: 'Set Volume',
        initial: 0.05,
        min: 0,
        max: 0.5,
        step: 0.01,
      },
    },
    script: {
      ['%(id)s_power_on' % config]: {
        name: 'Power On',
        sequence: [
          {
            service: 'media_player.turn_on',
            entity_id: 'media_player.%(device)s' % config,
          },
        ],
      },
      ['%(id)s_power_off' % config]: {
        name: 'Power Off',
        sequence: [
          {
            service: 'media_player.turn_off',
            entity_id: 'media_player.%(device)s' % config,
          },
        ],
      },
      ['%(id)s_source_set' % config]: {
        name: 'Set Source',
        sequence: [
          {
            service: 'media_player.select_source',
            entity_id: 'media_player.%(device)s' % config,
            data_template: {
              source: '{{ states.input_select.livingroom_tv_sources.state }}',
            },
          },
        ],
      },
      ['%(id)s_volume_set' % config]: {
        name: 'Set Volume',
        sequence: [
          {
            service: 'media_player.volume_set',
            entity_id: 'media_player.%(device)s' % config,
            data_template: {
              volume_level: '{{ states.input_number.livingroom_tv_volume.state|float }}',
            },
          },
        ],
      },
      ['%(id)s_volume_up' % config]: {
        name: 'Volume Up',
        sequence: [
          {
            service: 'media_player.volume_up',
            entity_id: 'media_player.%(device)s' % config,
          },
        ],
      },
      ['%(id)s_volume_down' % config]: {
        name: 'Volume Down',
        sequence: [
          {
            service: 'media_player.volume_down',
            entity_id: 'media_player.%(device)s' % config,
          },
        ],
      },
      ['%(id)s_volume_mute' % config]: {
        name: 'Volume Mute',
        sequence: [
          {
            service: 'media_player.volume_mute',
            entity_id: 'media_player.%(device)s' % config,
            data: {
              is_volume_muted: true,
            },
          },
        ],
      },
    },
    automation: {
      ['%(id)s_volume_init' % config]: {
        name: 'Init Volume',
        trigger: {
          platform: 'homeassistant',
          event: 'start',
        },
        action: {
          service: 'input_number.set_value',
          data_template: {
            entity_id: 'input_number.livingroom_tv_volume',
            value: "{{ state_attr('media_player.%(device)s', 'volume_level') }}" % config,
          },
        },
      },
      ['%(id)s_volume_update' % config]: {
        name: 'Update Volume',
        trigger: {
          platform: 'state',
          entity_id: 'media_player.%(device)s' % config,
        },
        action: {
          service: 'input_number.set_value',
          data_template: {
            entity_id: 'input_number.livingroom_tv_volume',
            value: '{{ trigger.to_state.attributes.volume_level }}',
          },
        },
      },
    },
    binary_sensor: {
      ['%(id)s_power_state' % config]: {
        platform: 'template',
        name: 'Power State',
        device_class: 'power',
        value_template: |||
          {{ state_attr('media_player.%(device)s', 'power_state') }}
        ||| % config,
        entity_id: [
          'media_player.%(device)s' % config,
        ],
      },
    },
    sensor: {
      ['%(id)s_volume' % config]: {
        platform: 'template',
        name: 'Volume',
        icon_template: 'mdi:lightbulb',
        value_template: |||
          {{ state_attr('media_player.%(device)s', 'volume_level') }}
        ||| % config,
        entity_id: [
          'media_player.%(device)s' % config,
        ],
      },
      ['%(id)s_source' % config]: {
        platform: 'template',
        name: 'Source',
        icon_template: 'mdi:lightbulb',
        value_template: |||
          {{ state_attr('media_player.%(device)s', 'media_content_id') }}
        ||| % config,
        entity_id: [
          'media_player.%(device)s' % config,
        ],
      },
    },
  },
}
