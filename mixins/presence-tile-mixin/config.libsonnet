local entity = (import 'entity.libsonnet');

{
  _config+:: {
    entity+: {
      presence_tile_entities: entity.presence_tile_entities,
    },
  },
}