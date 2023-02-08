#!/bin/bash

# Define the output file
OUTPUT_FILE="lxc_benchmark_$(date +%Y%m%d%H%M%S).txt"

# Start benchmarking
echo "Starting LXC benchmark, recording output for 10 seconds..."
start_time=$(date +%s)
end_time=$((start_time + 10))

# Loop to record the output for 10 seconds
while [ $(date +%s) -lt $end_time ]; do
  # Get the current time
  current_time=$(date +%s)

  # Record the CPU and memory usage of the LXC container
  lxc_stats=$(lxc info --no-humanize)
  echo "$current_time: $lxc_stats" >> $OUTPUT_FILE
  
  # Sleep for 1 second before recording the next output
  sleep 1
done

# End of the script
echo "LXC benchmark complete. Output saved to $OUTPUT_FILE"
