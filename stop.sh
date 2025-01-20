# Check if MEV version is requested
COMPOSE_FILE="compose.yaml"
if [ "$1" = "mev" ]; then
    COMPOSE_FILE="compose-mev-version.yaml"
    echo "Stopping MEV version..."
else
    echo "Stopping default version..."
fi

docker compose -f $COMPOSE_FILE stop
