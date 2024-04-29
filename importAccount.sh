
docker run \
  --rm \
  -it \
  -v $(pwd)/consensus-data:/consensus-data \
  -v $(pwd)/validator_keys:/validator_keys \
  -v $(pwd)/../network_config:/network_config \
  sigp/lighthouse:latest \
  lighthouse --testnet-dir=/network_config \
  account validator import --directory=/validator_keys
