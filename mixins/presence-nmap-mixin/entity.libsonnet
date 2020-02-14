{
  presence_nmap_entities(config):: {
    device_tracker: {
      ['%(id)s_tracker' % config]: {
        platform: 'nmap_tracker',
        name: config.name,
        home_interval: 5,
        hosts: config.hosts,
        interval_seconds: 30,
        scan_options: ' --privileged -sP ',
      },
    },
  },
}
