
# Network Scanner 💻🔎

A simple bash script to scan your network and gather information about connected devices. The script uses `wireshark` to gather the information and logs it to a file in `/netscan`. The log file contains the following information about each device:

-   Name
-   IP Address
-   MAC Address
-   Date and Time of recognition

Additionally, the script performs a port forwarding checklist and verifies connectivity to the network. All data is stored in a monthly `.xlsx` file in the `/netscan` directory.

The script runs twice a day in the background, so you can always stay up to date with what's happening on your network.

## Requirements

-   Wireshark

## Installation

The script will automatically install the required dependencies.

## Usage

Just run the script and let it do its magic!

🚀 Start exploring your network with ease!
