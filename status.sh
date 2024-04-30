#!/bin/bash

COMMON_HEADER="Content-Type: application/json"
API_TOKEN=$(cat "$(pwd)/validator_keys/api-token.txt")

echo "Requesting current block number from the Endurance mainnet..."
response=$(curl -s -X POST -H "$COMMON_HEADER" \
  --data '{"jsonrpc":"2.0","method":"eth_blockNumber","params":[],"id":1}' \
  "http://localhost:8545")
echo "Current Block Number: $response"
echo "---"

echo "Requesting current Execution Layer node peer count..."
peer_count=$(curl -s -X POST -H "$COMMON_HEADER" \
 --data '{"jsonrpc":"2.0","method":"net_peerCount","params":[],"id":1}' \
 "http://localhost:8545")
echo "Execution Layer Peers: $peer_count"
echo "---"

echo "Requesting current Consensus Layer node peer count..."
sync_status=$(curl -s --location --request GET \
  "http://127.0.0.1:5052/eth/v1/node/peer_count")
echo "Consensus Layer Peers: $sync_status"
echo "---"

echo "Requesting current syncing status of the Endurance 2.0 node..."
sync_status=$(curl -s --location --request GET \
  "http://127.0.0.1:5052/eth/v1/node/syncing")
echo "Syncing Status: $sync_status"
echo "---"

echo "Requesting current validator status..."
validator_status=$(curl -s --location --request GET \
  -H "Authorization: Bearer $API_TOKEN" \
  "http://127.0.0.1:5062/lighthouse/validators")
echo "Validator Status: $validator_status"
echo "---"
