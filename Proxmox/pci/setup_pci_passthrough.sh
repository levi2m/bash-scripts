#!/bin/bash

# Function to check if IOMMU is enabled
check_iommu() {
    dmesg | grep -e DMAR -e IOMMU
    if [ $? -ne 0 ]; then
        echo "IOMMU is not enabled. Please enable it in your BIOS and ensure the appropriate kernel parameters are set."
        exit 1
    else
        echo "IOMMU is enabled."
    fi
}

# Function to verify CPU virtualization support
check_cpu_virtualization() {
    lscpu | grep 'Virtualization: VT-x'
    if [ $? -ne 0 ]; then
        echo "CPU does not support VT-x/AMD-V. Please check your CPU and BIOS settings."
        exit 1
    else
        echo "CPU supports VT-x/AMD-V."
    fi
}

# Function to update GRUB for IOMMU support
update_grub() {
    grep -q "intel_iommu=on" /etc/default/grub
    if [ $? -ne 0 ]; then
        sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="/GRUB_CMDLINE_LINUX_DEFAULT="intel_iommu=on iommu=pt /' /etc/default/grub
        update-grub
    fi
    echo "GRUB updated with IOMMU support."
}

# Function to verify the presence of the NVIDIA GPU
check_nvidia_gpu() {
    lspci -nnk | grep -A2 'VGA compatible controller' | grep -i nvidia
    if [ $? -ne 0 ]; then
        echo "NVIDIA GPU not found. Please check your hardware."
        exit 1
    else
        echo "NVIDIA GPU found."
    fi
}

# Function to load VFIO modules
load_vfio_modules() {
    echo "vfio" >> /etc/modules
    echo "vfio_iommu_type1" >> /etc/modules
    echo "vfio_pci" >> /etc/modules
    echo "vfio_virqfd" >> /etc/modules
    update-initramfs -u
    echo "VFIO modules loaded."
}

# Function to configure the GPU for passthrough
configure_gpu_passthrough() {
    GPU_ID=$(lspci -nn | grep 'VGA compatible controller' | grep -i nvidia | awk '{print $1}')
    AUDIO_ID=$(lspci -nn | grep -A2 'VGA compatible controller' | grep -i nvidia | grep 'Audio device' | awk '{print $1}')
    echo "options vfio-pci ids=10de:1f08,10de:10f9" > /etc/modprobe.d/vfio.conf
    echo "blacklist nouveau" > /etc/modprobe.d/blacklist.conf
    echo "blacklist nvidia" >> /etc/modprobe.d/blacklist.conf
    echo "blacklist nvidiafb" >> /etc/modprobe.d/blacklist.conf
    echo "blacklist rivafb" >> /etc/modprobe.d/blacklist.conf
    update-initramfs -u
    echo "GPU configured for passthrough."
}

# Function to configure LXC container for GPU passthrough
configure_lxc() {
    local container_id=$1
    echo "Configuring LXC container $container_id for GPU passthrough..."
    
    pct set $container_id --mp0 /dev/dri,mp=/dev/dri
    pct set $container_id --mp1 /dev/nvidia0,mp=/dev/nvidia0
    pct set $container_id --mp2 /dev/nvidiactl,mp=/dev/nvidiactl
    pct set $container_id --mp3 /dev/nvidia-uvm,mp=/dev/nvidia-uvm
    pct set $container_id --mp4 /dev/nvidia-uvm-tools,mp=/dev/nvidia-uvm-tools

    echo "LXC container $container_id configured for GPU passthrough."
}

# Function to verify and setup PCI passthrough
setup_pci_passthrough() {
    check_iommu
    check_cpu_virtualization
    update_grub
    check_nvidia_gpu
    load_vfio_modules
    configure_gpu_passthrough
    echo "PCI passthrough setup completed on the host. Please reboot your system."

    # Ask for LXC container IDs to configure
    read -p "Enter the LXC container IDs to configure for GPU passthrough (separated by space): " -a container_ids

    for container_id in "${container_ids[@]}"; do
        configure_lxc $container_id
    done

    echo "All specified LXC containers have been configured for GPU passthrough."
}

# Main script execution
setup_pci_passthrough
