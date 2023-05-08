#!/bin/sh

pkill busybox
busybox httpd -f -p 8080 -h ~/Sync/www
