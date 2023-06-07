#!/bin/bash

# Function to check network connectivity
check_connectivity() {
  ping -c 3 google.com >/dev/null 2>&1
  if [ $? -eq 0 ]; then
    echo "Connectivity is working fine."
  else
    echo "Connectivity is not working."
    exit 1
  fi
}

# Function to check the nameserver configuration
check_nameserver() {
  grep "nameserver" /etc/resolv.conf >/dev/null 2>&1
  if [ $? -eq 0 ]; then
    echo "Nameserver configuration is present."
  else
    echo "Nameserver configuration is missing."
    exit 1
  fi
}

# Function to fix the nameserver configuration
fix_nameserver() {
  echo "Using default nameservers: 8.8.8.8 and 1.1.1.1"

  echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf >/dev/null
  echo "nameserver 1.1.1.1" | sudo tee -a /etc/resolv.conf >/dev/null
  echo "Nameserver configuration updated successfully."
}

# Main script
echo "Checking network connectivity..."
check_connectivity

echo "Checking nameserver configuration..."
check_nameserver

echo "Do you want to fix the nameserver configuration? (y/n)"
read fix_option

if [ "$fix_option" == "y" ]; then
  if [ "$(id -u)" -eq 0 ]; then
    fix_nameserver
  else
    echo "Root/sudo access is required to update the nameserver configuration."
    exit 1
  fi
fi

echo "Network troubleshooting completed."

