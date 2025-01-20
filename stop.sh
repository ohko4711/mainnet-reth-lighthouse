# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
PROJECT_NAME="$(basename "${SCRIPT_DIR}")"

# Check if MEV boost service exists
if docker ps | grep "${PROJECT_NAME}-boost-1"; then
    echo "Stopping MEV version..."
    docker compose -f "${SCRIPT_DIR}/compose-mev-version.yaml" stop
else
    echo "Stopping default version..."
    docker compose -f "${SCRIPT_DIR}/compose.yaml" stop
fi
