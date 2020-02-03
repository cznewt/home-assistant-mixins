#!/bin/bash

MIXIN=$1
UPDATE=$2

function globexists {
  test -e "$1" -o -L "$1"
}

echo "Testing mixin '${MIXIN}.jsonnet'..."

# set -x

mkdir -p "build/${MIXIN}"
rm -rf "build/${MIXIN}/*.yaml"
rm -rf "build/${MIXIN}/*.conf"

jsonnet -S -J vendor -J mixins -m "build/${MIXIN}" "${MIXIN}.jsonnet"
./scripts/remove_quotes.py "./build/${MIXIN}/*.yaml"

# hass --script check_config --config "build/${MIXIN}"

if [ "${UPDATE}" == "update" ]
then
    mkdir -p "${MIXIN}_out"
    if globexists build/${MIXIN}/*.yaml
    then
        cp build/${MIXIN}/*.yaml ${MIXIN}_out/
    fi
    if globexists build/${MIXIN}/*.conf
    then
        cp build/${MIXIN}/*.conf ${MIXIN}_out/
    fi
fi
