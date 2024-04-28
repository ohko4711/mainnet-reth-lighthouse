curl -X POST \
 -H "Content-Type: application/json" \
 --data '{"jsonrpc":"2.0","method":"net_peerCount","params":[],"id":1}' \
 http://localhost:8545


echo "---\n"

curl --location --request GET 'http://127.0.0.1:5052/eth/v1/node/syncing'

