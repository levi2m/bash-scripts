#!/bin/bash

# Install Wireshark, the network protocol analyzer
sudo apt-get update
sudo apt-get install wireshark -y

# Start scanning the network
echo "Starting network scan..."

# Log file location
log_file="/netscan/network_scan_$(date +"%Y%m%d_%H%M%S").log"

# Scan network and save information to log file
sudo wireshark -k -i <interface> -a duration:60 -w $log_file

# Parse log file to extract relevant information
echo "Name, IP, MAC, Date, Time" > extracted_data.csv
tshark -r $log_file -T fields -e frame.time_relative -e ip.src -e eth.src | while read line; do
  time=$(echo $line | awk '{print $1}')
  ip=$(echo $line | awk '{print $2}')
  mac=$(echo $line | awk '{print $3}')
  date=$(date -d @$time +"%Y-%m-%d")
  hour=$(date -d @$time +"%H:%M:%S")
  echo "Unknown, $ip, $mac, $date, $hour" >> extracted_data.csv
done

# Forward information to Pi-hole
curl -X POST -H "Content-Type: text/plain" --data-binary "@extracted_data.csv" <Pi-hole URL>

# Convert log file to .xlsx file and store in /netscan folder
ssconvert extracted_data.csv netscan/network_scan.xlsx

echo "Network scan complete and data has been stored in /netscan folder."
