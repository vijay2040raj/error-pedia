## VMware Kernel Update Fix

This repository provides a convenient solution for resolving the issue of VMware not running due to kernel update problems. It includes two scripts that automate the process of installing the necessary kernel modules for VMware.

### Prerequisites
- VMware Workstation or VMware Player installed on your system.
- Internet connection.

### Usage

To fix the VMware kernel update problem, follow these steps:

1. Open a terminal and run the following command to download and execute the first installation script:

   ```shell
   sudo curl -s https://raw.githubusercontent.com/vijay2040raj/error-pedia/linux/application%20fix/vmware/install_kernal.sh | sudo sh
   ```

   If the first script doesn't work, proceed to the next step.

2. Run the second installation script by executing the following command:

   ```shell
   curl -s https://raw.githubusercontent.com/vijay2040raj/error-pedia/linux/vmware/t.sh | sudo sh
   ```

   This script will handle the necessary installation steps to fix the VMware kernel update issue.

### References

For more information and troubleshooting, refer to the following Ask Ubuntu thread:

- [VMware Workstation: Virtual machine monitor & Virtual ethernet service issue](https://askubuntu.com/questions/1377852/vmware-workstation-virtual-machine-monitor-virtual-ethernet-service-issue)

Please note that this repository is provided as-is, and I am not responsible for any issues that may arise from its usage. Use it at your own risk.
