#!/bin/bash

# Define the backup directory and log file
backup_dir='/backup'
log_file="$backup_dir/backup_log_$(date +%Y-%m-%d_%H:%M:%S).log"

# Define the source directory and backup file name
src_dir='/path/to/src/dir'
backup_file="$backup_dir/backup_$(date +%Y-%m-%d_%H:%M:%S).tar.gz"

# Create the backup directory if it doesn't exist
if [ ! -d "$backup_dir" ]; then
  mkdir "$backup_dir"
fi

# Backup the source directory
tar -czvf "$backup_file" "$src_dir" &>> "$log_file"

# Check for errors
if [ $? -eq 0 ]; then
  echo "Backup successful" &>> "$log_file"
else
  echo "Backup failed" &>> "$log_file"
fi

# Generate a report at the end of the month
month=$(date +%m)
last_day_of_month=$(date -d "$(date +%Y-%m-01) + 1 month - 1 day" +%d)
today=$(date +%d)

if [ "$today" -eq "$last_day_of_month" ]; then
  echo "Generating monthly report..." &>> "$log_file"

  # Code to generate the xlsx file with all the jobs done and compression rate
  # ...
fi
