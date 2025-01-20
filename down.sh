export IP_ADDRESS=$(curl -4 ifconfig.io)

if [ -z "$IP_ADDRESS" ]; then
    echo "Failed to retrieve IP address"
    exit 1
fi

export CL_CHECKPOINT=https://checkpointz.endurancehub.org/

echo "Using IP address: $IP_ADDRESS"

FEE_RECEIPIENT=$(cat "$(pwd)/fee_recipient.txt")
export FEE_RECEIPIENT


# Read contents from files and assign to variables
EL_BOOTNODES=enode://164276f9943a38d527c5e53eb41677397c0abfdb83f4d78bf92aa7e1b2eddb9d6f22016a9ecb4d69bc6df0f67ca1bc57cc70431f188ef630646776bf2452d733@152.53.82.212:30303,enode://630a3bfc641634870db1b10b8a66e37d123eb00e824e616bd85f3ec7394ae7d0a07edd5e73847036e62ecc39691351256cfe89c57a22fedca7241d7942da6fe8@138.201.159.60:30303,enode://fc56df1424e7d50c4b1d8ce45dce1fc34644a0c85b410d5598c6e792480fae9bd6088abbe8d4a4346670613485f6b3353827fc4ec5d0fd0b79b1feb6eca21f68@65.109.226.1:30303,enode://0e354a2ab10edf0c3f632a35c7d2578acf7ec1b8e1583903e883b877ca3b49aa9b4dfde7c564d3ffcdd37176bacc9ce182c4ceb15bbcd15973cffe727a103e41@149.28.221.67:30303
CL_TRUSTPEERS=16Uiu2HAkvgWMqm7uwfVFXAu4uf9zp8AA7snx5ucugsFwtKY1nKuV,16Uiu2HAmRRLVCGqqvoRQjJMRuqAVLE7dsFCDA5GskZZdtSCqWseg,16Uiu2HAmPjJZj7gQEtvkiWxevMkE2JDbDZpYVRZKnZ19PELcVJUX,16Uiu2HAmAh6xSTHyir1gKRvYhPcvPhbJDthUTCbqZpNc3hFmXxsz
CL_BOOTNODES=enr:-Ma4QHdL-0PeoJBM0Sbykm7hKjJM7uaxlmLzmnOxxTvybcUKR2CoZhqWzYPH4kL5vkkpr77cgSY1d56LOT24623vlZaCAaeHYXR0bmV0c4j__________4RldGgykLLsBBZQAAAB__________-CaWSCdjSCaXCEmDVS1IRxdWljgiMpiXNlY3AyNTZrMaECEqiFl_JbDNpfZNPMLYzpWf0XoX9N4zvWIwZXvx_4-dSIc3luY25ldHMPg3RjcIIjKIN1ZHCCIyg,enr:-MK4QNGrzIvpYcTqD4gjltgIJUyYjkc3POlyGAhVconi08fUMEdooxbIxpQaERuUGxPpG4YbNRm5ORXeK-uuTOKMOgGGAY4MsJdbh2F0dG5ldHOIAAAAYAAAAACEZXRoMpCy7AQWUAAAAf__________gmlkgnY0gmlwhIrJnzyJc2VjcDI1NmsxoQO9qJEgZwPlM48KvXc5IN2gjCeXpjU-AI8aFa_hAiGAuYhzeW5jbmV0cwCDdGNwgjLIg3VkcIIu4A,enr:-MK4QPosWQfluWCCGGe2GIdBBCP8RmjAYdbPOX9kw1Uzuy-xeJMhEOI7CPxlR0qu2S1omal6_lKff12fpuWcwXaJcoCGAY4MtFdBh2F0dG5ldHOIAAAABgAAAACEZXRoMpCy7AQWUAAAAf__________gmlkgnY0gmlwhEFt4gGJc2VjcDI1NmsxoQOki3l8IAnD0LYrbdieyHOF9X7TgLGiTQsTUGCgmS8uUIhzeW5jbmV0cwCDdGNwgjLIg3VkcIIu4A,enr:-MS4QD1QxH5ujtrycpXwhlE3UvbmUF4ZKkHGL7jRH2xSAU3ebvtKoLJ7ucTKSfu-cIzki7cWtfR744VyFWDSmjTZV04Eh2F0dG5ldHOIAAAAAAAAAACEZXRoMpCy7AQWUAAAAf__________gmlkgnY0gmlwhJUc3UOEcXVpY4IjKYlzZWNwMjU2azGhAuLTQdm353Y9L51NXIpPWtLkqzixVUzsRry_zmlU_0x5iHN5bmNuZXRzAIN0Y3CCIyiDdWRwgiMo
CL_STATICPEERS=/ip4/152.53.82.212/tcp/9000/p2p/16Uiu2HAkvgWMqm7uwfVFXAu4uf9zp8AA7snx5ucugsFwtKY1nKuV,/ip4/138.201.159.60/tcp/13000/p2p/16Uiu2HAmRRLVCGqqvoRQjJMRuqAVLE7dsFCDA5GskZZdtSCqWseg,/ip4/65.109.226.1/tcp/13000/p2p/16Uiu2HAmPjJZj7gQEtvkiWxevMkE2JDbDZpYVRZKnZ19PELcVJUX,/ip4/0.0.0.0/tcp/9000/p2p/16Uiu2HAmAh6xSTHyir1gKRvYhPcvPhbJDthUTCbqZpNc3hFmXxsz

# Export the variables
export EL_BOOTNODES
export CL_TRUSTPEERS
export CL_BOOTNODES
export CL_STATICPEERS
# ========================================
# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
PROJECT_NAME="$(basename "${SCRIPT_DIR}")"
# Check if MEV boost service exists
if docker ps | grep "${PROJECT_NAME}-boost-1"; then
    echo "Stopping MEV version..."
    docker compose -f "${SCRIPT_DIR}/compose-mev-version.yaml" down
else
    echo "Stopping default version..."
    docker compose -f "${SCRIPT_DIR}/compose.yaml" down
fi
