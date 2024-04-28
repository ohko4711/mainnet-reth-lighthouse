import json
import os

def read_json_file(file_path):
    with open(file_path, 'r') as file:
        return json.load(file)

def create_secrets_directory():
    secrets_dir = 'validator_keys_secrets'
    if not os.path.exists(secrets_dir):
        os.makedirs(secrets_dir)
    return secrets_dir

def create_secret_files(pubkeys, secrets_dir, password):
    for pubkey in pubkeys:
        secret_file_name = f'0x{pubkey}'
        file_path = os.path.join(secrets_dir, secret_file_name)
        with open(file_path, 'w') as file:
            file.write(password)

def main(directory_path, password):
    secrets_dir = create_secrets_directory()  # Call this once to setup the directory
    for file_path in os.listdir(directory_path):
        full_path = os.path.join(directory_path, file_path)
        if os.path.isfile(full_path) and file_path.startswith("keystore-m_") and file_path.endswith(".json"):
            data = read_json_file(full_path)
            if 'pubkey' in data:
                pubkeys = [data['pubkey']]
                create_secret_files(pubkeys, secrets_dir, password)

if __name__ == "__main__":
    import sys
    if len(sys.argv) != 3:
        print("Usage: python script.py <directory_path> <password>")
    else:
        directory_path = sys.argv[1]
        password = sys.argv[2]
        main(directory_path, password)
