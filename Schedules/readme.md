
## System Monitor 🔍

Do you want to keep track of your system performance and be alerted when it reaches high levels of CPU or memory usage? Look no further! 💡

Our System Monitor script is here to help you keep your system running smoothly. 🚀

### Features 📊

-   Runs unattended twice a day in the background 🕵️‍♂️
-   Logs performance information to a folder in `/log/performance/` with a separate folder for each day 🗓️
-   Compares performance levels and tags events as 'critical' if CPU or memory usage is above 80% 💡
-   Generates a monthly `.xlsx` report to store all the data from the monitor and highlights events tagged as 'critical' 📊
-   Collects information about the apps consuming CPU and memory during critical events 💻
-   Sends a Discord message to you using a chat bot when critical events occur, keeping you informed in real-time 📢
-   Installs dependencies automatically 💻
-   Scheduled to run twice a day using a cron job 🕰️

### How to Use 💻

1.  Clone the repository to your system
2.  Give the script executable permissions with `chmod +x system_monitor.sh`
3.  Run the script with `./system_monitor.sh`

And that's it! The script will now run in the background, keeping track of your system performance and alerting you when necessary. 🚀

### Tips 💡

-   Make sure to replace the Discord webhook URL in the script with your own to receive alerts on your Discord server.
-   Update the name and tag used in the script to receive accurate alerts in Discord.
-   The monthly report will be generated in the `/log/performance/` folder.

So, what are you waiting for? Get started today and keep your system performance under control! 🎯
