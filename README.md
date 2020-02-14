# Configuration Mixins for Home Assistant

> NOTE: This project is *pre-release* stage. Flags, configuration, behaviour and
> design may change significantly in following releases.

A set of configuration snippets for Home Assistant.

## Releases

| Release | Home Assistant   | ESPHome   |
| ------- | ---------------- | --------- |
| master  | 0.104+           | 1.14+     |

## How to use

The mixins are designed to be vendored into the repo with your infrastructure
config. Use [jsonnet-bundler][jb] to fetch the library code.

## Generate config files

You can manually generate the config files, but first you must install some
tools:

```
$ go get github.com/jsonnet-bundler/jsonnet-bundler/cmd/jb
$ brew install jsonnet
```

Grab the mixins and its dependencies:

```
$ git clone https://github.com/cznewt/home-assistant-mixins
$ cd home-assistant-mixins
$ make init
```

Build the mixin:

```
$ make config
```

The files in `config_out` need to be provided to your Home Assistant instance.
The exact details will depending on how you deploy your Home Assistant stack.

[jb]:https://github.com/jsonnet-bundler/jsonnet-bundler
