# Performance Testing Script for Debian LXC Container 🧪

Are you experiencing buffering issues with your Nextcloud installation on a Debian LXC container? This script is here to help! 💪

This script will gather performance information for various resources (CPU, RAM, disk I/O, network, and video streaming) for 30 seconds and store the results in a log file. The log file can be used to identify any bottlenecks in the system that may be causing the buffering issues. 🔍

## How to Use 💻

1.  Clone the repository to your Debian LXC container.
2.  Make the script executable by running `chmod +x nameofyourscript.sh`.
3.  Run the script with `./nameofyourscript.sh`.

The script will install necessary tools (`iostat`, `htop`, `ping`, `traceroute`, and `ffmpeg`) if they are not already installed. 💾

## Results 📊

The results of the performance tests will be stored in a log file named `performance_test.log`. The log file will include:

-   CPU usage information 💻
-   RAM usage information 🧠
-   Disk I/O information 💾
-   Network performance information (ping and traceroute) 📡
-   Video streaming performance information (frame rate, time, and bitrate) 🎥

You can use the information in the log file to identify any bottlenecks in the system and make necessary changes to improve performance. 💪

👨‍💻 Happy performance testing! 🚀
