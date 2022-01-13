#!/bin/bash

# This script will setup a local static IP address.

message quest "IP address (example: 192.168.0.100): "
read -p " " ip

message quest "Gateway (example: 192.168.0.1): "
read -p " " gateway

nmcli dev status
message quest "Connection: "
read -p " " connection

message info "Changing IP from DHCP to STATIC..."
nmcli con mod "$connection" ipv4.addresses $ip/24
nmcli con mod "$connection" ipv4.gateway $gateway

message info "Select a DNS hosting service."
message quest "(1) pihole (192.168.0.100)\n             (2) google (8.8.8.8)\n             (3) cloudflare (1.1.1.1)\n      [1/2/3]: "
read -p " " dns
    case $dns in
      1) nmcli con mod  "$connection" ipv4.dns '192.168.0.100';;
	    2) nmcli con mod "$connection" ipv4.dns '8.8.8.8';;
      3) nmcli con mod "$connection" ipv4.dns '1.1.1.1';;
      *) message error "$dns is not a valid option!";;
    esac

# Applying changes.
message info "Applying changes..."
nmcli con mod "$connection" ipv4.method manual
nmcli con up "$connection"

# Restarting network settings.
message info "Restarting network settings"
sudo systemctl restart NetworkManager.service