#!/bin/bash

# Function to check network connectivity
check_connectivity() {
  ping -c 3 google.com >/dev/null 2>&1
  if [ $? -eq 0 ]; then
    echo "Connectivity is working fine."
  else
    echo "Connectivity is not working."
   
  fi
}

# Function to fix the network interface
fix_network_interface() {
  echo "Resetting network interface..."

  # Determine the network interface name
  interface=""
  if command -v ip >/dev/null 2>&1; then
    interface=$(ip route show default | awk '/default/ {print $5; exit}')
  elif command -v ifconfig >/dev/null 2>&1; then
    interface=$(ifconfig -a | sed 's/[ \t].*//;/^\(lo\|\)$/d' | head -n 1)
  else
    echo "Unable to determine the network interface."
    exit 1
  fi

  if [ -z "$interface" ]; then
    echo "Unable to determine the network interface."
    exit 1
  fi

  # Restart the network interface
  if command -v ip >/dev/null 2>&1; then
    sudo ip link set "$interface" down
    sudo ip link set "$interface" up
  elif command -v ifconfig >/dev/null 2>&1; then
    sudo ifconfig "$interface" down
    sudo ifconfig "$interface" up
  fi

  echo "Network interface reset successfully."
}

# Main script
echo "Checking network connectivity..."
check_connectivity || { echo "Network connectivity check failed."; exit 1; }

echo "Do you want to reset the network interface? (y/n)"
read reset_option

if [ "$reset_option" == "y" ]; then
  if [ "$(id -u)" -eq 0 ]; then
    fix_network_interface || { echo "Failed to reset the network interface."; exit 1; }
  else
    echo "Root/sudo access is required to reset the network interface."
    exit 1
  fi
fi

echo "Network troubleshooting completed."
