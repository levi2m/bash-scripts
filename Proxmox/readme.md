# PCI Passthrough Setup Script

This repository contains a script to automate the verification and setup of PCI passthrough for an NVIDIA GPU on a Proxmox VE host. The script also configures specified LXC containers to use the GPU.

## Prerequisites

- Proxmox VE on the latest version.
- Intel or AMD CPU with virtualization support (VT-x/VT-d or AMD-V/AMD-Vi).
- NVIDIA GPU (e.g., RTX 2060).
- IOMMU enabled in the BIOS.

## Script Overview

The script performs the following tasks:

1. Verifies if IOMMU is enabled.
2. Checks CPU virtualization support.
3. Updates GRUB configuration to enable IOMMU.
4. Verifies the presence of the NVIDIA GPU.
5. Loads necessary VFIO modules.
6. Configures the GPU for passthrough.
7. Configures specified LXC containers for GPU passthrough.

## Usage

### Step 1: Clone the Repository

```bash
git clone https://github.com/levi2m/bash-scripts/proxmox/pci-passthrough-setup.git
cd pci-passthrough-setup
```

### Step 3: Run the Script

Execute the script as the root user:

```bash
./setup_pci_passthrough.sh
```

### Step 4: Reboot the System

After the script completes the host configuration, reboot your system to apply the changes:

```bash
reboot
```

### Step 5: Configure LXC Containers

After the reboot, run the script again and provide the LXC container IDs when prompted to configure them for GPU passthrough:

```bash
./setup_pci_passthrough.sh
```

## Script Details

### Function Descriptions

- **check_iommu**: Verifies if IOMMU is enabled.
- **check_cpu_virtualization**: Checks if the CPU supports virtualization (VT-x/AMD-V).
- **update_grub**: Updates GRUB configuration to enable IOMMU.
- **check_nvidia_gpu**: Verifies the presence of the NVIDIA GPU.
- **load_vfio_modules**: Loads necessary VFIO modules.
- **configure_gpu_passthrough**: Configures the GPU for passthrough.
- **configure_lxc**: Configures LXC containers for GPU passthrough.

### Variables

- **GPU_ID**: PCI ID of the NVIDIA GPU.
- **AUDIO_ID**: PCI ID of the NVIDIA GPU's audio device.

## Example Output

```bash
IOMMU is enabled.
CPU supports VT-x/AMD-V.
GRUB updated with IOMMU support.
NVIDIA GPU found.
VFIO modules loaded.
GPU configured for passthrough.
PCI passthrough setup completed on the host. Please reboot your system.
Enter the LXC container IDs to configure for GPU passthrough (separated by space): 101 102
Configuring LXC container 101 for GPU passthrough...
LXC container 101 configured for GPU passthrough.
Configuring LXC container 102 for GPU passthrough...
LXC container 102 configured for GPU passthrough.
All specified LXC containers have been configured for GPU passthrough.
```

## Troubleshooting

If you encounter any issues, ensure that:

1. IOMMU is enabled in the BIOS.
2. The GPU is correctly installed and recognized by the system.
3. The LXC container IDs provided are valid and exist on the system.

For further assistance, please open an issue on the GitHub repository.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
