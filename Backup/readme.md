# 💾 Backup Script 💾

A bash script that backs up important files or directories to the `/backup` directory. The backup file is compressed with the highest compression rate to save disk space, and is named with the date and time it was executed. A log file is generated in the `/backup` directory with the same naming convention, and the script outputs a message indicating whether the backup was successful or failed. At the end of each month, the script generates a report in the form of an xlsx file with information on all the backups performed and the compression rate.

## 📊 Features 📊

-   Backs up the specified directory to the `/backup` directory
-   Uses the highest compression rate to save disk space
-   Generates a log file with the date and time in the filename
-   Outputs a message indicating whether the backup was successful or failed
-   Generates a monthly report at the end of each month with information on all the backups performed and the compression rate

## 🚀 Getting Started 🚀

1.  Clone the repository: `git clone https://github.com/<your-username>/bash-scripts.git`
2.  Navigate to the `bash-scripts/backup` directory
3.  Edit the `src_dir` variable to specify the directory you want to back up
4.  Make the script executable: `chmod +x backup.sh`
5.  Run the script: `./backup.sh`

## 🔧 Prerequisites 🔧

-   A Unix-based operating system (e.g. Linux, macOS)
-   The `tar` command must be installed

## 📅 Schedule the Backup 📅

To run the Backup script on a regular basis, once a day, add it to a cron job:

1.  Edit the cron file: `crontab -e`
2.  Add the following line to run the script at 12:00 PM (noon) every day: `0 12 * * * /path/to/backup.sh`

## 📜 License 📜

This project is licensed under the MIT License - see the [MIT License](https://choosealicense.com/licenses/mit/) file for details.

## 💡 Contributing 💡

Contributions are welcome! If you would like to contribute to the project, please open a pull request.

## 🙏 Acknowledgements 🙏

-   Thank you to OpenAI for the training data used to create the language model that generated this script!
