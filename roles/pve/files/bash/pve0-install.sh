wget 192.168.0.101:8080/pve0_driver-nvidia.conf --directory-prefix=/usr/share/X11/xorg.conf.d/driver-nvidia.conf
xinit -- -dpi 96 >/dev/tty2 2>&1
