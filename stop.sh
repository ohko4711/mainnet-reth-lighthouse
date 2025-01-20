# Check if MEV version is running
if docker compose -f compose-mev-version.yaml ps | grep -q "Up"; then
    echo "Stopping MEV version..."
    docker compose -f compose-mev-version.yaml stop
else
    echo "Stopping default version..."
    docker compose -f compose.yaml stop
fi
