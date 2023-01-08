#!/bin/bash

wget https://cloud-images.ubuntu.com/minimal/releases/jammy/release/ubuntu-22.04-minimal-cloudimg-amd64.img

echo Hello, what is the VMID for this machine?
read virmacid

qm set $virmacid --serial0 socket --vga serial0

mv ubuntu-22.04-minimal-cloudimg-amd64.img ubuntu-22.04.qcow2

echo And, what is the VMs storage size \(32G\)?
read storesize

qemu-img resize ubuntu-22.04.qcow2 $storesize

echo The VMs storage will be placed on which pve disk?
read diskloc

qm importdisk $virmacid ubuntu-22.04.qcow2 $diskloc

rm ubuntu-22.04.qcow2
