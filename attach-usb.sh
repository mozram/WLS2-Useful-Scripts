#! /bin/bash

## Must set an argument of the USB ID to attach. Use lsusb to get the ID.
## For example attach-usb.sh 1050:0407

set -e

USBIPD_BIN="usbipd.exe"

# Check args
if [ -z "${1}" ]; then
    echo "No device specified. Exitting..."
    exit
else 
    USB_ID=${1}
    echo "Attaching $USB_ID"
fi

# Get busid based on device ID
USB_BUSID=$($USBIPD_BIN list | grep "$USB_ID" | awk '{print $1}')

# Attach the device, and set auto attach
$USBIPD_BIN attach --wsl -b $USB_BUSID -a