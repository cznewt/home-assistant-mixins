{
  climate_netatmo_entities(config):: {
    climate: {
      ['%(id)s_climate' % config]: {
        platform: 'netatmo',
      },
    },
  },
}
