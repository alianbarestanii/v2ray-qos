#!/bin/bash

clear
echo "====== V2Ray QoS Installer ======"

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit
fi

read -p "Enter V2Ray port: " PORT
read -p "Enter speed limit (Mbps): " RATE

INTERFACE=$(ip route get 1 | awk '{print $5;exit}')

echo ""
echo "Network interface detected: $INTERFACE"
echo "Applying QoS..."

apt update -y >/dev/null 2>&1
apt install iproute2 iptables -y >/dev/null 2>&1

tc qdisc del dev $INTERFACE root 2>/dev/null

iptables -t mangle -F

iptables -t mangle -A PREROUTING -p tcp --dport $PORT -j MARK --set-mark 10
iptables -t mangle -A OUTPUT -p tcp --sport $PORT -j MARK --set-mark 10

tc qdisc add dev $INTERFACE root handle 1: htb default 30
tc class add dev $INTERFACE parent 1: classid 1:1 htb rate 1gbit
tc class add dev $INTERFACE parent 1:1 classid 1:10 htb rate ${RATE}mbit ceil ${RATE}mbit
tc class add dev $INTERFACE parent 1:1 classid 1:30 htb rate 1gbit ceil 1gbit

tc filter add dev $INTERFACE protocol ip parent 1:0 prio 1 handle 10 fw flowid 1:10

echo ""
echo "✅ QoS applied!"
echo "Port: $PORT"
echo "Limit: $RATE Mbps"
