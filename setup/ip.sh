#!/bin/bash

# This script will setup a local static IP address.

message quest "IP address (example: 192.168.0.100):"
read -p " " IP

message quest "Gateway (example: 192.168.0.1):"
read -p " " GATEWAY

nmcli dev status
message quest "Connection:"
read -p " " CONNECTION

message info "Changing IP from DHCP to STATIC..."
nmcli con mod "$CONNECTION" ipv4.addresses $IP/24
nmcli con mod "$CONNECTION" ipv4.gateway $GATEWAY

message quest "Select a DNS hosting service."
message info "(1) pihole (192.168.0.100)\n(2) google (8.8.8.8)\n(3) cloudflare (1.1.1.1)\n[1/2/3]"
read -p " " DNS
    case $DNS in
      1) nmcli con mod  "$CONNECTION" ipv4.dns '192.168.0.100';;
	    2) nmcli con mod "$CONNECTION" ipv4.dns '8.8.8.8';;
      3) nmcli con mod "$CONNECTION" ipv4.dns '1.1.1.1';;
      *) message error "$DNS is not a valid option!";;
    esac

# Applying changes.
message info "Applying changes..."
nmcli con mod "$CONNECTION" ipv4.method manual
nmcli con up "$CONNECTION"

# Restarting network settings.
message info "Restarting network settings"
sudo ip link set "$CONNECTION" down && sudo ip link set "$CONNECTION" up