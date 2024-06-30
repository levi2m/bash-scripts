##Steps to Use the Script
Save the Script: Save the above script to a file, e.g., setup_pci_passthrough.sh.

##Make the Script Executable: Run the following command to make the script executable:

chmod +x setup_pci_passthrough.sh

##Run the Script: Execute the script as the root user:

bash ./setup_pci_passthrough.sh

##Reboot: After the script completes the host configuration, reboot your system to apply the changes.

## Configure LXC Containers: After the reboot, run the script again and provide the LXC container IDs when prompted to configure them for GPU passthrough.
