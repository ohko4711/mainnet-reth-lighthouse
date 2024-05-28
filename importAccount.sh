#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: $0 <validator_keys_directory>"
  exit 1
fi

VALIDATOR_KEYS_DIR=$1

docker run \
  --rm \
  -it \
  -v $(pwd)/consensus-data:/consensus-data \
  -v $VALIDATOR_KEYS_DIR:/validator_keys \
  -v $(pwd)/../network_config:/network_config \
  sigp/lighthouse:latest \
  lighthouse \
  --testnet-dir=/network_config \
  --datadir=/consensus-data \
  account validator import \
  --directory=/validator_keys