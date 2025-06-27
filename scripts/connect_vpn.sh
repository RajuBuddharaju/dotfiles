#!/bin/bash

# Directory where all your .ovpn configs are stored
VPN_DIR=~/vpn

# Check if user passed an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <country>"
  echo "Example: $0 japan"
  exit 1
fi

# Convert input to lowercase and prepare config path
COUNTRY=$(echo "$1" | tr '[:upper:]' '[:lower:]')
CONFIG_FILE="$VPN_DIR/$COUNTRY.ovpn"

# Check if the config file exists
if [ ! -f "$CONFIG_FILE" ]; then
  echo "Error: Config file '$CONFIG_FILE' not found."
  exit 2
fi

# Run OpenVPN with the selected config
echo "Connecting to VPN for '$COUNTRY'..."
sudo openvpn --config "$CONFIG_FILE"

