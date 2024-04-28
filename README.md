

This repository makes it easy to start a node on the Endurance Mainnet, including the execution layer, consensus layer, and validator node. Just follow this command line on your server.

```
git clone https://github.com/lyfsn/mainnet-reth-lighthouse
cd mainnet-reth-lighthouse

./downloadGenesis.sh

export FEE_RECEIPIENT=your Endurance wallet address

./start.sh

./status.sh
```


