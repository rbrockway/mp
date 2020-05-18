#!/bin/bash

#
# Robert Brockway
#
# May 2020
#

AVAIL=$(grep ^MemAvailable /proc/meminfo | cut -b 17-24)
TOTAL=$(grep ^MemTotal /proc/meminfo | cut -b 17-24)
#BUFFERS=$(grep ^Buffers /proc/meminfo | cut -b 17-24)
#CACHED=$(grep ^Cached /proc/meminfo | cut -b 17-24)
#FREE=$(grep ^MemFree /proc/meminfo | cut -b 17-24)

echo "Memory utilisation: $(( $(( $TOTAL - $AVAIL )) * 100 / $TOTAL ))%"
#echo "Buffers: $(( $BUFFERS * 100 / $TOTAL ))%"
#echo "Cache: $(( $CACHED * 100 / $TOTAL ))%"
#echo "Free: $(( $FREE * 100 / $TOTAL ))%"
