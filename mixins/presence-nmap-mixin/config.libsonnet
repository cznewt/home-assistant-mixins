local entity = (import 'entity.libsonnet');

{
  _config+:: {
    entity+: {
      presence_nmap_entities: entity.presence_nmap_entities,
    },
  },
}