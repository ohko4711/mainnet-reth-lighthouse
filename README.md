# Endurance Mainnet Node Setup

This repository provides a simple way to set up a node on the Endurance Mainnet, covering the execution layer, consensus layer, and validator node. Execute the following commands on your server to get started.

### Usage

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

Replace `<Your-ACE-Wallet-Address>` with your actual wallet address. Like this `export FEE_RECEIPIENT=0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045`.

```
export FEE_RECEIPIENT=<Your-ACE-Wallet-Address>
```

**4. Start the node:**

```
./start.sh
```

**5. Query the node status:**

```
./status.sh
```

### Validator (not necessary)

**Generate the secret file using the keystore file:**

```
python lighthouseSecrets.py validator_keys <Password of keystore file>
```
