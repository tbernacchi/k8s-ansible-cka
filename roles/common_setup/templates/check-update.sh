#!/bin/bash
APT_UPDATED="/tmp/apt-update-tstamp"

# Update apt if needed
if [ ! -f "$APT_UPDATED" ];then
	apt-get update && apt-get upgrade -y
	touch "$APT_UPDATED"
fi
