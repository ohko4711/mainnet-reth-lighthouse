#!/bin/bash

# Define API URL variables
API_URL="http://localhost:8545"
ETH2_API_URL="http://127.0.0.1:5052/eth/v1/node/syncing"

echo "Fetching the current block number from the Ethereum mainnet..."
# Send a JSON-RPC request to get the current block number
response=$(curl -s -X POST \
  -H "Content-Type: application/json" \
  --data '{"jsonrpc":"2.0","method":"eth_blockNumber","params":[],"id":1}' \
  "$API_URL")

# Display the response or error message
echo "Response: $response"
echo "---"

echo "Querying the current number of network peers..."
# Send a request to get the network peer count
peer_count=$(curl -s -X POST \
 -H "Content-Type: application/json" \
 --data '{"jsonrpc":"2.0","method":"net_peerCount","params":[],"id":1}' \
 "$API_URL")

# Display the response or error message
echo "Response: $peer_count"
echo "---"

echo "Checking the syncing status of Ethereum 2.0 node..."
# Use a GET request to query the ETH2 node syncing status
sync_status=$(curl -s --location --request GET "$ETH2_API_URL")

# Display the response or error message
echo "Response: $sync_status"
echo "---"
