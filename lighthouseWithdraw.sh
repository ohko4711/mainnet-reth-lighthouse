#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 KEYFILE"
    exit 1
fi

KEYFILE="$1"


export IP_ADDRESS=$(curl -4 ifconfig.io)

if [ -z "$IP_ADDRESS" ]; then
    echo "Failed to retrieve IP address"
    exit 1
fi

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
  --beacon-node http://$IP_ADDRESS:5052
