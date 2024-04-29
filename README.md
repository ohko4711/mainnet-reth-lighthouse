# Endurance Mainnet Node Setup

This repository provides a simple way to set up a node on the Endurance Mainnet, covering the execution layer, consensus layer, and validator node. Execute the following commands on your server to get started.

### Preparation

This repository is based on Docker, so you need to install Docker before using it: [Install Docker Engine](https://docs.docker.com/engine/install/)

### Installation and Initialization

**Complete the following steps only once to set up your node:**

**1. Clone the repository and navigate into the directory:**

```
git clone https://github.com/lyfsn/mainnet-reth-lighthouse
cd mainnet-reth-lighthouse
```

**2. Download the genesis file:**

```
./downloadGenesis.sh
```

**3. Configure your fee recipient address:**

Replace `<Your-ACE-Wallet-Address>` with your actual wallet address.

```
echo -n '<Your-ACE-Wallet-Address>' > fee_recipient.txt
```

Example: `echo -n '0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045' > fee_recipient.txt`

### Node Operations

**Start the node:**

```
./start.sh
```

**Stop the node:**

```
./stop.sh
```

**Query the node status:**

```
./status.sh
```
