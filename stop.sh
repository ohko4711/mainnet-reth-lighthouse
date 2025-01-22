#!/bin/bash

# Export the variables with default values if not already set
export IP_ADDRESS=${IP_ADDRESS:-127.0.0.1}
export EL_BOOTNODES=${EL_BOOTNODES:-""}
export FEE_RECEIPIENT=${FEE_RECEIPIENT:-""}
export CL_TRUSTPEERS=${CL_TRUSTPEERS:-""}
export CL_BOOTNODES=${CL_BOOTNODES:-""}
export CL_STATICPEERS=${CL_STATICPEERS:-""}
export CL_CHECKPOINT=${CL_CHECKPOINT:-""}
export BUILDER_FLAG=${BUILDER_FLAG:-""}
export BUILDER_PROPOSALS=${BUILDER_PROPOSALS:-""}
export COMPOSE_FILE="compose.yaml"
# ========================================
# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
PROJECT_NAME="$(basename "${SCRIPT_DIR}")"

# Check if MEV boost service exists
if docker ps | grep "${PROJECT_NAME}-boost-1"; then
    echo "Stopping MEV version..."
    export COMPOSE_FILE="mev-boost.yaml:compose.yaml"
else
    echo "Stopping default version..."    
fi

cd "${SCRIPT_DIR}"
docker compose stop
