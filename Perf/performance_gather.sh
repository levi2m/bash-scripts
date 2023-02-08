#!/bin/bash

# Update the package repository
apt update

# Install necessary tools
apt install -y sysstat htop ping traceroute ffmpeg

# Define the log file
log_file="performance_test.log"

# Check if the tools are installed
if [ $(which iostat) ]; then
  echo "iostat is installed."
else
  echo "iostat is not installed."
fi

if [ $(which htop) ]; then
  echo "htop is installed."
else
  echo "htop is not installed."
fi

if [ $(which ping) ]; then
  echo "ping is installed."
else
  echo "ping is not installed."
fi

if [ $(which traceroute) ]; then
  echo "traceroute is installed."
else
  echo "traceroute is not installed."
fi

if [ $(which ffmpeg) ]; then
  echo "ffmpeg is installed."
else
  echo "ffmpeg is not installed."
fi

# Test CPU usage
echo "Testing CPU usage..."
echo "CPU Usage Test" >> $log_file
iostat -c 30 >> $log_file

# Test RAM usage
echo "Testing RAM usage..."
echo "RAM Usage Test" >> $log_file
free -m -s 30 >> $log_file

# Test disk I/O
echo "Testing disk I/O..."
echo "Disk I/O Test" >> $log_file
iostat -dx 30 >> $log_file

# Test network performance
echo "Testing network performance..."
echo "Network Performance Test" >> $log_file
ping -c 30 www.google.com >> $log_file
traceroute www.google.com >> $log_file

# Test video streaming performance
echo "Testing video streaming performance..."
echo "Video Streaming Performance Test" >> $log_file
ffmpeg -i video.mp4 -f null /dev/null 2>&1 | awk '/frame=.*fps.*time.*bitrate/ {print $0}' >> $log_file
