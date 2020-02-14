{
  presence_tile_entities(config):: {
    device_tracker: {
      ['%(id)s_tracker' % config]: {
        platform: 'tile',
        name: config.name,
        show_inactive: false,
        username: config.username,
        password: config.password,
      },
    },
  },
}
