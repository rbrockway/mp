#!/bin/bash

#
# Robert Brockway
#
# May 2020
#
# Memory Percent
#

AVAILMEMORY=$(grep ^MemAvailable /proc/meminfo | cut -b 17-24)
TOTALMEMORY=$(grep ^MemTotal /proc/meminfo | cut -b 17-24)
TOTALSWAP=$(swapon -s | grep -v File | cut -b 50-56 | paste -s -d+ | bc)
USEDSWAP=$(swapon -s | grep -v File | cut -b 58-70 | paste -s -d+ | bc)

#BUFFERS=$(grep ^Buffers /proc/meminfo | cut -b 17-24)
#CACHED=$(grep ^Cached /proc/meminfo | cut -b 17-24)
#FREE=$(grep ^MemFree /proc/meminfo | cut -b 17-24)
#echo "Buffers: $(( $BUFFERS * 100 / $TOTAL ))%"
#echo "Cache: $(( $CACHED * 100 / $TOTAL ))%"
#echo "Free: $(( $FREE * 100 / $TOTAL ))%"

echo "Memory utilisation: $(( $(( $TOTALMEMORY - $AVAILMEMORY )) * 100 / $TOTALMEMORY ))%"
echo "Swap utilisation: $(( $USEDSWAP * 100 / $TOTALSWAP ))%"

