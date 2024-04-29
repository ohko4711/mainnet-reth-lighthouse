#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 KEYFILE"
    exit 1
fi

KEYFILE="$1"

docker run \
  --rm \
  -it \
  -v $(pwd)/../network_config:/network_config \
  -v "$(pwd)/${KEYFILE}:/${KEYFILE}" \
  sigp/lighthouse:latest \
  lighthouse \
  --datadir=/consensus-data \
  --testnet-dir=/network_config \
  account validator exit \
  --keystore "/${KEYFILE}" \
  --beacon-node http://127.0.0.1:5052
