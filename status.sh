#!/bin/bash

# Common header for JSON-RPC requests
COMMON_HEADER="Content-Type: application/json"

# API token for accessing the validators
API_TOKEN=$(cat "$(pwd)/validator_keys/api-token.txt")

echo "Fetching the current block number from the Endurance mainnet..."
# Send a JSON-RPC request to get the current block number
response=$(curl -s -X POST -H "$COMMON_HEADER" \
  --data '{"jsonrpc":"2.0","method":"eth_blockNumber","params":[],"id":1}' \
  "http://localhost:8545")

# Display the response or error message
echo "Response: $response"
echo "---"

echo "Querying the current number of network peers..."
# Send a request to get the network peer count
peer_count=$(curl -s -X POST -H "$COMMON_HEADER" \
 --data '{"jsonrpc":"2.0","method":"net_peerCount","params":[],"id":1}' \
 "http://localhost:8545")

# Display the response or error message
echo "Response: $peer_count"
echo "---"

echo "Checking the syncing status of Endurance 2.0 node..."
# Use a GET request to query the ETH2 node syncing status
sync_status=$(curl -s --location --request GET \
  "http://127.0.0.1:5052/eth/v1/node/syncing")

# Display the response or error message
echo "Response: $sync_status"
echo "---"

echo "Checking the validator status..."
# Querying validator status with authorization
validator_status=$(curl -s --location --request GET \
  -H "Authorization: Bearer $API_TOKEN" \
  "http://127.0.0.1:5062/lighthouse/validators")

# Display the response or error message
echo "Response: $validator_status"
echo "---"
