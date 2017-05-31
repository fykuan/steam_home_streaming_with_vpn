#!/usr/bin/env bash
#
# IP address of streaming server
SERVER="192.168.67.207"
#
# ref: https://lg.io/2015/04/12/run-your-own-high-end-cloud-gaming-service-on-ec2.html
#
# Install wireshock and socat first
#    brew install wireshark socat
#
tshark -T fields -e data -l 'udp and dst port 27036' | script -q /dev/null xxd -r -p | nc -b tap0 -u ${SERVER} 27036 > /dev/null

