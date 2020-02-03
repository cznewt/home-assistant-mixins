{
  climate_sensor_entities(config):: {
    input_number: {
      local day_part_value = config.domains[domain].value_day_part[day_part],
      ['%(id)s_%(domain)s_%(day_part)s' % (config { domain: domain, day_part: day_part.part })]:
        {
          name: '%(day_part)s %(domain)s' % {
            domain: config.domains[domain].name,
            day_part: day_part.name,
          },
          initial: day_part.value,
          step: 0.1,
          min: config.domains[domain].value_min,
          max: config.domains[domain].value_max,
          [if domain == 'temperature' || domain == 'humidity' then 'device_class']: domain,
        }
      for domain in std.objectFields(config.domains)
      if std.objectHas(config.domains[domain], 'value_day_parts')
      for day_part in config.domains[domain].value_day_parts
    } + {
      ['%(id)s_%(domain)s' % (config { domain: domain })]:
        {
          name: '%(domain)s' % { domain: config.domains[domain].name },
          initial: config.domains[domain].value,
          min: config.domains[domain].value_min,
          max: config.domains[domain].value_max,
        }
      for domain in std.objectFields(config.domains)
      if std.objectHas(config.domains[domain], 'value')
    },
    sensor: {
      ['%(id)s_actual_%(domain)s' % (config { domain: domain })]: {
        platform: 'template',
        name: '%(domain)s Actual' % { domain: config.domains[domain].name },
        device_class: 'temperature',
        value_template: |||
          {{ states("input_select.%(sensor)s_scenes") }}
        ||| % config.domains[domain],
        entity_id: [
          config.domains[domain].sensor,
        ],
      }
      for domain in std.objectFields(config.domains)
    },
    /* + {
     ['%(id)s_model_low_%(domain)s' % (config { domain: domain })]: {}
     for domain in std.objectFields(config.domains)
     } + {
     ['%(id)s_model_high_%(domain)s' % (config { domain: domain })]: {}
     for domain in std.objectFields(config.domains)
     }
    },*/
  },
}
