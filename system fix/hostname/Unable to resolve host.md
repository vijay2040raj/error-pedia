# Setup Guide

This guide will walk you through the steps to set up your hostname and update the `/etc/hosts` file on your Linux system.

## Step 1: Check Hostname

First, let's check the current hostname configured on your system. Open the terminal and execute the following command:

```bash
cat /etc/hostname
```

The output will display the current hostname in the format `hostname.domain`. The hostname represents your PC name, and the domain can be any value.

## Step 2: Update the `/etc/hosts` File

Now, we need to update the `/etc/hosts` file to associate the hostname with the loopback address. Open the `/etc/hosts` file using a text editor (e.g., `nano`, `vi`, or `gedit`).

```bash
sudo nano /etc/hosts
```

Locate the line that starts with `127.0.0.1` and add your hostname and domain after it. Here's an example:

```bash
127.0.0.1 localhost
127.0.0.1 hostname.domain
```

Save the file and exit the text editor.

## Step 3: Test the Configuration

To ensure that the changes are applied successfully, you can restart the network service or reboot your system. Alternatively, you can use the `hostnamectl` command to set the hostname immediately without a reboot:

```bash
sudo hostnamectl set-hostname hostname.domain
```

After making the changes and applying them, you can verify the new hostname by running the following command:

```bash
hostname
```

The output should display your updated hostname.

## Additional Resources

For a visual demonstration of the steps mentioned above, you can refer to the following video tutorial: [Linux Hostname and /etc/hosts Configuration](https://youtu.be/z0q-zN-mi-Q)

Feel free to explore more about Linux networking and system administration to enhance your knowledge and skills.

Please note that these instructions are specific to Linux systems. If you're using a different operating system, the steps may vary.

