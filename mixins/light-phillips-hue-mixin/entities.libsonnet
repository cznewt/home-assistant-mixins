{
  light_phillips_hue_color_entities(config):: {
    input_select: {
      ['%(id)s_scenes' % config]: {
        name: 'Select Scene',
        options: config.scenes,
        [if std.objectHas(config, 'scene_initial') then 'initial']:
          config.scene_initial,
      },
    },
    input_number: {
      ['%(id)s_brightness' % config]: {
        name: 'Set Brightness',
        initial: 128,
        min: 1,
        max: 254,
        step: 1,
      },
    },
    script: {
      ['%(id)s_brightness_set' % config]: {
        name: 'Set Brightness',
        sequence: [
          {
            service: 'light.turn_on',
            entity_id: 'light.%(hue_group)s' % config,
            data_template: {
              brightness: |||
                {{ states.input_number.%(id)s_brightness.state|int }}
              ||| % config,
            },
          },
        ],
      },
      ['%(id)s_scene_set' % config]: {
        name: 'Set Scene',
        sequence: [
          {
            service: 'hue.hue_activate_scene',
            data_template: {
              group_name: config.hue_group,
              scene_name: |||
                {{ states.input_number.%(id)s_scenes.state }}
              ||| % config,
            },
          },
        ],
      },
      ['%(id)s_turn_off' % config]: {
        name: 'Turn Off',
        sequence: [
          {
            service: 'light.turn_off',
            entity_id: 'light.%(hue_group)s' % config,
          },
        ],
      },
      ['%(id)s_brightness_up' % config]: {
        name: 'Raise Brightness',
        sequence: [
          {
            service: 'light.turn_on',
            entity_id: 'light.%(hue_group)s' % config,
            data_template: {
              brightness: std.strReplace(|||
                {% set suggested = states.light.%(hue_group)s.attributes.brightness|int + 32 %}
                {% if suggested < 254 %}{{ suggested }}
                {% else %}254{% endif %}
              |||, '%(hue_group)s', config.hue_group),
            },
          },
        ],
      },
      ['%(id)s_brightness_down' % config]: {
        name: 'Lower Brightness',
        sequence: [
          {
            service: 'light.turn_on',
            entity_id: 'light.%(hue_group)s' % config,
            data_template: {
              brightness: std.strReplace(|||
                {% set suggested = states.light.%(hue_group)s.attributes.brightness|int - 32 %}
                {% if suggested > 0 %}
                {{ suggested }}
                {% else %}1
                {% endif %}
              |||, '%(hue_group)s', config.hue_group),
            },
          },
        ],
      },
    },
    automation: {
      ['%(id)s_scene_set' % config]: {
        name: 'Set Scene',
        trigger: {
          platform: 'state',
          entity_id: 'input_select.%(id)s_scenes' % config,
        },
        action: {
          service: 'script.toggle',
          entity_id: 'script.%(id)s_scene_set' % config,
        },
      },
      ['%(id)s_brightness_set' % config]: {
        name: 'Set Brightness',
        trigger: {
          platform: 'state',
          entity_id: 'input_number.%(id)s_brightness' % config,
        },
        condition: {
          condition: 'template',
          value_template: std.strReplace(|||
            {{ state_attr('light.%(hue_group)s', 'brightness')|int != states.input_number.livingroom_lights_brightness.state|int }}
          |||, '%(hue_group)s', config.hue_group),
        },
        action: {
          service: 'script.toggle',
          entity_id: 'script.%(id)s_scene_set' % config,
        },
      },
      ['%(id)s_brightness_init' % config]: {
        name: 'Init Brightness',
        trigger: {
          platform: 'homeassistant',
          event: 'start',
        },
        action: [
          {
            delay: '00:00:05',
          },
          {
            service: 'input_number.set_value',
            data_template: {
              entity_id: 'input_number.%(id)s_brightness' % config,
              value: |||
                {{ state_attr('light.%(hue_group)s', 'brightness') }}
              ||| % config,
            },
          },
        ],
      },
      ['%(id)s_brightness_update' % config]: {
        name: 'Update Brightness',
        trigger: {
          platform: 'state',
          entity_id: 'light.%(hue_group)s' % config,
        },
        action: {
          service: 'input_number.set_value',
          data_template: {
            entity_id: 'input_number.%(id)s_brightness' % config,
            value: |||
              {{ trigger.to_state.attributes.brightness }}
            |||,
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
          {{ states("light.%(hue_group)s") }}
        ||| % config,
        entity_id: [
          'light.%(hue_group)s' % config,
        ],
      },
    },
    sensor: {
      ['%(id)s_brightness' % config]: {
        platform: 'template',
        name: 'Brigtness',
        icon_template: 'mdi:lightbulb',
        value_template: |||
          {{ states("input_number.%(id)s_brightness")|int / 256 }}
        ||| % config,
        unit: '%',
        entity_id: [
          'light.%(hue_group)s' % config,
        ],
      },
      ['%(id)s_scene' % config]: {
        platform: 'template',
        name: 'Scene',
        icon_template: 'mdi:lightbulb',
        value_template: |||
          {{ states("input_select.%(id)s_scenes") }}
        ||| % config,
        entity_id: [
          'light.%(hue_group)s' % config,
        ],
      },
    },
  },
}
